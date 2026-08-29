-- RGOL.UY — tabla de gastos generales (packaging, envíos, publicidad, comisiones, etc.)
-- Separada de "compras" porque compras siempre es stock de camisetas (requiere talle_id);
-- esto es para cualquier otro gasto del negocio que también hay que restar del saldo.

create table if not exists gastos (
  id uuid primary key default gen_random_uuid(),
  concepto text not null,
  monto numeric not null check (monto > 0),
  categoria text,
  forma_pago text,
  fecha date not null default current_date,
  nota text,
  created_at timestamptz not null default now()
);

alter table gastos enable row level security;

create policy "gastos admin" on gastos
for all
using (auth.role() = 'authenticated')
with check (auth.role() = 'authenticated');

grant select, insert, update, delete on gastos to authenticated;
