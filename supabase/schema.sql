-- Si ya corriste una versión anterior de este schema (con "categoria" en vez de
-- "categorias"), corré primero este bloque para empezar limpio antes del resto:
--   drop table if exists ventas, compras, talles, productos cascade;
--   drop function if exists stock_publico();

-- RGOL.UY — esquema de base de datos (Supabase / Postgres)
-- Reemplaza el registro manual en Excel: productos, talles, stock, compras y ventas.

-- ============ PRODUCTOS ============
create table if not exists productos (
  id uuid primary key default gen_random_uuid(),
  nombre text not null,
  liga text,
  categorias text[] not null default '{}',
  constraint categorias_validas check (
    categorias <@ array['equipos','selecciones','retro']::text[]
    and array_length(categorias,1) > 0
  ),
  precio numeric not null,
  precio_oferta numeric,
  badge text,
  imagenes text[] not null default '{}',
  activo boolean not null default true,
  created_at timestamptz not null default now()
);

-- ============ TALLES (una fila por combinación producto+talle) ============
create table if not exists talles (
  id uuid primary key default gen_random_uuid(),
  producto_id uuid not null references productos(id) on delete cascade,
  talle text not null,
  stock_inicial integer not null default 0,
  unique (producto_id, talle)
);

-- ============ COMPRAS (ingreso de stock) ============
create table if not exists compras (
  id uuid primary key default gen_random_uuid(),
  talle_id uuid not null references talles(id) on delete restrict,
  cantidad integer not null check (cantidad > 0),
  costo_unitario numeric,
  proveedor text,
  forma_pago text,
  fecha date not null default current_date,
  nota text,
  created_at timestamptz not null default now()
);

-- ============ VENTAS ============
create table if not exists ventas (
  id uuid primary key default gen_random_uuid(),
  talle_id uuid not null references talles(id) on delete restrict,
  cantidad integer not null default 1 check (cantidad > 0),
  valor_abonado numeric,
  valor_costo numeric,
  forma_pago text,
  cliente text,
  fecha date not null default current_date,
  nota text,
  created_at timestamptz not null default now()
);

-- ============ VISTA: stock real (uso interno, panel admin) ============
create or replace view vista_stock as
select
  t.id as talle_id,
  p.id as producto_id,
  p.nombre,
  t.talle,
  t.stock_inicial
    + coalesce((select sum(c.cantidad) from compras c where c.talle_id = t.id), 0)
    - coalesce((select sum(v.cantidad) from ventas v where v.talle_id = t.id), 0)
    as stock_actual
from talles t
join productos p on p.id = t.producto_id;

-- ============ FUNCIÓN PÚBLICA: solo disponible sí/no (para el catálogo) ============
-- security definer: se ejecuta con permisos elevados para poder leer vista_stock
-- (que depende de compras/ventas, privadas) pero solo expone disponible true/false,
-- nunca cantidades, costos ni precios. Es la forma segura recomendada por Supabase
-- para exponer un resumen público de datos que en su tabla base son privados.
create or replace function stock_publico()
returns table (producto_id uuid, talle text, disponible boolean)
language sql
security definer
set search_path = public
as $$
  select producto_id, talle, (stock_actual > 0) as disponible
  from vista_stock;
$$;

revoke all on function stock_publico() from public;
grant execute on function stock_publico() to anon, authenticated;

-- ============ ROW LEVEL SECURITY ============
alter table productos enable row level security;
alter table talles enable row level security;
alter table compras enable row level security;
alter table ventas enable row level security;

-- Lectura pública de catálogo (para la web)
create policy "productos publicos" on productos for select using (activo = true);
create policy "talles publicos" on talles for select using (true);

-- Todo lo demás (escritura de productos/talles, y compras/ventas enteras) solo admin autenticado
create policy "productos admin" on productos for all using (auth.role() = 'authenticated') with check (auth.role() = 'authenticated');
create policy "talles admin" on talles for all using (auth.role() = 'authenticated') with check (auth.role() = 'authenticated');
create policy "compras admin" on compras for all using (auth.role() = 'authenticated') with check (auth.role() = 'authenticated');
create policy "ventas admin" on ventas for all using (auth.role() = 'authenticated') with check (auth.role() = 'authenticated');

-- Nota: vista_stock hereda RLS de las tablas base, así que solo el panel admin
-- (autenticado) puede leerla directo. El sitio público llama a la función
-- stock_publico() vía RPC, que expone únicamente disponible true/false por talle.

-- ============ GRANTS ============
-- Postgres exige un GRANT de tabla además de las políticas de RLS. Sin esto,
-- "anon" no puede leer ni siquiera lo que las políticas permitirían.
grant select on productos, talles to anon, authenticated;
grant select, insert, update, delete on productos, talles, compras, ventas to authenticated;
