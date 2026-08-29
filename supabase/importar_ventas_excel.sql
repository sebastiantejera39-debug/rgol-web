-- ============================================================
-- Importacion de ventas historicas desde REGISTRO DE VENTAS RGOL.uy.xlsx
-- Generado por Claude a partir del Excel + confirmaciones de Sebastian (29 ago 2026)
-- Correr todo este script de una vez en el SQL Editor de Supabase.
-- ============================================================

-- 1) Productos nuevos (inactivos: son camisetas que ya no estan en el catalogo,
--    se cargan solo para poder registrar las ventas historicas correspondientes)
insert into productos (id, nombre, liga, categorias, precio, badge, activo) values ('05f5eb5c-04ee-40ab-b7c8-532598905fdc', 'Argentina · Titular Jugador 25/26', null, ARRAY['selecciones'], 2500, null, false);
insert into productos (id, nombre, liga, categorias, precio, badge, activo) values ('6093f4bc-3009-4ca5-ba7b-3ec355cd091b', 'Barcelona · Tercera 24/25', 'La Liga · España', ARRAY['equipos'], 2000, null, false);
insert into productos (id, nombre, liga, categorias, precio, badge, activo) values ('0b980e3e-baa1-4bfa-84c8-69bf0bce4874', 'Celtic · Tercera', 'Escocia', ARRAY['equipos'], 2000, null, false);
insert into productos (id, nombre, liga, categorias, precio, badge, activo) values ('fe08291c-029f-4f23-a650-425a98cbafed', 'Roma · Tercera', 'Serie A · Italia', ARRAY['equipos'], 2000, null, false);
insert into productos (id, nombre, liga, categorias, precio, badge, activo) values ('156145af-6888-4ea0-9e8e-ad77652b5b53', 'España · Visitante Jugador 25/26', null, ARRAY['selecciones'], 2500, null, false);
insert into productos (id, nombre, liga, categorias, precio, badge, activo) values ('31b7ba38-1014-4b80-b5e9-09345a9a8cba', 'Barcelona · Retro 1996', 'La Liga · España', ARRAY['equipos','retro'], 2000, 'Retro', false);
insert into productos (id, nombre, liga, categorias, precio, badge, activo) values ('b4df6303-6ab8-4e18-b145-df7e29e3c4fd', 'Celtic · Titular', 'Escocia', ARRAY['equipos'], 2000, null, false);
insert into productos (id, nombre, liga, categorias, precio, badge, activo) values ('f469a799-8d30-4320-bf7f-5a10bed4025e', 'Ferrari · Titular', null, ARRAY['equipos'], 2000, null, false);

-- 2) Talles de esos productos nuevos
insert into talles (id, producto_id, talle, stock_inicial) values ('9e4236ee-570b-4d88-8cc3-576b1d5ddf95', '05f5eb5c-04ee-40ab-b7c8-532598905fdc', 'XL', 0);
insert into talles (id, producto_id, talle, stock_inicial) values ('5a2898a0-e29b-490a-8e4d-f06c846d0534', '6093f4bc-3009-4ca5-ba7b-3ec355cd091b', 'S', 0);
insert into talles (id, producto_id, talle, stock_inicial) values ('059a20c8-30a5-46c6-b322-c5a5ed35d4f9', '0b980e3e-baa1-4bfa-84c8-69bf0bce4874', 'L', 0);
insert into talles (id, producto_id, talle, stock_inicial) values ('dd01e0dd-3ac2-4edd-8ce9-506ef10deb58', 'fe08291c-029f-4f23-a650-425a98cbafed', 'L', 0);
insert into talles (id, producto_id, talle, stock_inicial) values ('fcbf0062-678b-4b32-b4ac-ef613d74a799', '156145af-6888-4ea0-9e8e-ad77652b5b53', 'XXL', 0);
insert into talles (id, producto_id, talle, stock_inicial) values ('55c3d190-0af2-41e8-85ea-c8f2c05b2bef', '156145af-6888-4ea0-9e8e-ad77652b5b53', 'XL', 0);
insert into talles (id, producto_id, talle, stock_inicial) values ('a8a41175-92ba-4778-80fb-2516fc30c8fb', '156145af-6888-4ea0-9e8e-ad77652b5b53', 'M', 0);
insert into talles (id, producto_id, talle, stock_inicial) values ('59ef1e1e-494e-44c4-a0dc-1b72c9cd3078', '31b7ba38-1014-4b80-b5e9-09345a9a8cba', 'XL', 0);
insert into talles (id, producto_id, talle, stock_inicial) values ('93f0efeb-91b0-459a-85cd-3e9a7e724f08', 'b4df6303-6ab8-4e18-b145-df7e29e3c4fd', 'XL', 0);
insert into talles (id, producto_id, talle, stock_inicial) values ('1113852d-ef7b-4692-abd7-52e253c5567a', 'f469a799-8d30-4320-bf7f-5a10bed4025e', 'XL', 0);

-- 3) Talles historicos agregados a productos que ya existen en el catalogo
--    (el talle se vendio en su momento pero ya no esta disponible / no se volvio a stockear)
-- Brasil · Titular 26/27
insert into talles (id, producto_id, talle, stock_inicial) values ('fcdd29ae-6fe2-46bd-a362-aee46d97dc06', '679e18bd-2333-4c4d-adb7-b913130798f2', 'L', 0);
-- Inter Miami · Visitante
insert into talles (id, producto_id, talle, stock_inicial) values ('46b390c7-45c3-41ce-88c2-e014d5d1baa8', '059b30e2-e3a6-4f48-87fc-8a88e593931c', 'L', 0);
-- Alemania · Visitante 25/26
insert into talles (id, producto_id, talle, stock_inicial) values ('d5f1f183-bb5f-41b1-86cb-4d0cfe2d4b50', 'db4b6620-7831-4b38-af29-faf7d8f61747', 'XL', 0);
-- Arsenal · Tercera 2025
insert into talles (id, producto_id, talle, stock_inicial) values ('6c21c858-683f-4392-9eb4-cb7b69fb59ba', '73922fd4-7151-4cd8-977e-58b91e69ebd6', 'L', 0);
-- Manchester City · Tercera 2025
insert into talles (id, producto_id, talle, stock_inicial) values ('c6e3b01d-0669-4187-b67d-3eb2ede7256f', '82f7f31d-cf70-4b9d-92d3-6b337baf022a', 'L', 0);
-- Arsenal · Titular Manga Larga
insert into talles (id, producto_id, talle, stock_inicial) values ('573f96e8-25ad-4d41-a5b6-7ecdc1a1f15a', 'c2bf472b-5185-4b5e-9344-384cd5f6be9a', 'M', 0);

-- 4) Las 30 ventas del Excel
insert into ventas (talle_id, cantidad, valor_abonado, valor_costo, forma_pago, cliente, fecha, nota) values ('fcdd29ae-6fe2-46bd-a362-aee46d97dc06', 1, 2000, 800, 'Transferencia', 'Santiago Castelnoble', '2026-06-01', 'Importado del Excel (fila Id 1)');
insert into ventas (talle_id, cantidad, valor_abonado, valor_costo, forma_pago, cliente, fecha, nota) values ('9e4236ee-570b-4d88-8cc3-576b1d5ddf95', 1, 2500, 800, 'Transferencia', 'Gonzalo Rivas', '2026-06-10', 'Importado del Excel (fila Id 2)');
insert into ventas (talle_id, cantidad, valor_abonado, valor_costo, forma_pago, cliente, fecha, nota) values ('46b390c7-45c3-41ce-88c2-e014d5d1baa8', 1, 2000, 800, 'Transferencia', 'Cesar Meneses', '2026-06-11', 'Importado del Excel (fila Id 3)');
insert into ventas (talle_id, cantidad, valor_abonado, valor_costo, forma_pago, cliente, fecha, nota) values ('d5f1f183-bb5f-41b1-86cb-4d0cfe2d4b50', 1, 2000, 720, 'Transferencia', 'Julio Piastre', '2026-06-12', 'Importado del Excel (fila Id 4)');
insert into ventas (talle_id, cantidad, valor_abonado, valor_costo, forma_pago, cliente, fecha, nota) values ('5a2898a0-e29b-490a-8e4d-f06c846d0534', 1, 2000, 1000, 'Transferencia', 'Ana Piastre', '2026-06-14', 'Importado del Excel (fila Id 5)');
insert into ventas (talle_id, cantidad, valor_abonado, valor_costo, forma_pago, cliente, fecha, nota) values ('21bbd072-2355-4dad-af73-288fcab85b35', 1, 2000, 720, 'Transferencia', 'Matias Calvo', '2026-06-24', 'Importado del Excel (fila Id 6)');
insert into ventas (talle_id, cantidad, valor_abonado, valor_costo, forma_pago, cliente, fecha, nota) values ('2a969413-2628-4097-b260-0adb46493549', 1, 2200, 1700, 'Transferencia', 'Matias Calvo', '2026-06-29', 'Importado del Excel (fila Id 7)');
insert into ventas (talle_id, cantidad, valor_abonado, valor_costo, forma_pago, cliente, fecha, nota) values ('5f2813df-5bd1-410d-9c66-8a1dc9bd9fc3', 1, 2200, 1700, 'Transferencia', 'Matias Calvo', '2026-06-29', 'Importado del Excel (fila Id 8)');
insert into ventas (talle_id, cantidad, valor_abonado, valor_costo, forma_pago, cliente, fecha, nota) values ('059a20c8-30a5-46c6-b322-c5a5ed35d4f9', 1, 2000, 1000, 'Transferencia', 'Cesar Meneses', '2026-04-04', 'Importado del Excel (fila Id 9)');
insert into ventas (talle_id, cantidad, valor_abonado, valor_costo, forma_pago, cliente, fecha, nota) values ('dd01e0dd-3ac2-4edd-8ce9-506ef10deb58', 1, 2000, 1000, 'Transferencia', 'Cesar Meneses', '2026-04-04', 'Importado del Excel (fila Id 10)');
insert into ventas (talle_id, cantidad, valor_abonado, valor_costo, forma_pago, cliente, fecha, nota) values ('6c21c858-683f-4392-9eb4-cb7b69fb59ba', 1, 1800, 800, 'Transferencia', 'Equipo Rua', '2026-07-01', 'Importado del Excel (fila Id 12)');
insert into ventas (talle_id, cantidad, valor_abonado, valor_costo, forma_pago, cliente, fecha, nota) values ('13615ea7-ae19-485a-948c-fd7814388c1b', 1, 2000, 1200, 'Mercado Pago', 'Juan Venneri', '2026-07-01', 'Importado del Excel (fila Id 13)');
insert into ventas (talle_id, cantidad, valor_abonado, valor_costo, forma_pago, cliente, fecha, nota) values ('56f14baa-e41d-4f17-bbdc-448363f778dd', 1, 2000, 1200, 'Transferencia', 'Maxi Viera', '2026-07-03', 'Importado del Excel (fila Id 14)');
insert into ventas (talle_id, cantidad, valor_abonado, valor_costo, forma_pago, cliente, fecha, nota) values ('565e1b59-8f79-4be9-b0de-b4b451fc26a7', 1, 2000, 1500, 'Transferencia', 'Florencia Ibarra', '2026-07-06', 'Importado del Excel (fila Id 15)');
insert into ventas (talle_id, cantidad, valor_abonado, valor_costo, forma_pago, cliente, fecha, nota) values ('fd0d46c9-4028-40ed-9dfc-1ceed27c0779', 1, 2000, 800, 'Transferencia', 'Julio Piastre', '2026-07-06', 'Importado del Excel (fila Id 16)');
insert into ventas (talle_id, cantidad, valor_abonado, valor_costo, forma_pago, cliente, fecha, nota) values ('8d8f32c0-04fa-4c54-b500-ccd297119984', 1, 2000, 1800, 'Transferencia', 'Vanina Martinelli', '2026-07-07', 'Importado del Excel (fila Id 17)');
insert into ventas (talle_id, cantidad, valor_abonado, valor_costo, forma_pago, cliente, fecha, nota) values ('c6e3b01d-0669-4187-b67d-3eb2ede7256f', 1, 2000, 1000, 'Transferencia', 'Camila Pintos', '2026-07-10', 'Importado del Excel (fila Id 18)');
insert into ventas (talle_id, cantidad, valor_abonado, valor_costo, forma_pago, cliente, fecha, nota) values ('8eb8efcd-090e-4515-98a5-ee01cd8be3ff', 1, 2000, 800, 'Transferencia', 'Maru (Wsp)', '2026-07-11', 'Importado del Excel (fila Id 19)');
insert into ventas (talle_id, cantidad, valor_abonado, valor_costo, forma_pago, cliente, fecha, nota) values ('fcbf0062-678b-4b32-b4ac-ef613d74a799', 1, 2500, 1300, 'Pendiente', 'Cesar Meneses', '2026-07-13', 'Importado del Excel (fila Id 20)');
insert into ventas (talle_id, cantidad, valor_abonado, valor_costo, forma_pago, cliente, fecha, nota) values ('5aac9c46-b536-4c9b-a69a-3b897224e230', 1, 2600, 1000, 'Transferencia', 'Ayelen Molina', '2026-07-13', 'Importado del Excel (fila Id 21)');
insert into ventas (talle_id, cantidad, valor_abonado, valor_costo, forma_pago, cliente, fecha, nota) values ('55c3d190-0af2-41e8-85ea-c8f2c05b2bef', 1, 2500, 1300, 'Transferencia', 'Montse (instagram)', '2026-07-14', 'Importado del Excel (fila Id 22)');
insert into ventas (talle_id, cantidad, valor_abonado, valor_costo, forma_pago, cliente, fecha, nota) values ('59ef1e1e-494e-44c4-a0dc-1b72c9cd3078', 1, 2000, 800, 'Efectivo', 'Bru familia', '2026-07-04', 'Importado del Excel (fila Id 23)');
insert into ventas (talle_id, cantidad, valor_abonado, valor_costo, forma_pago, cliente, fecha, nota) values ('3ad8e7ae-f98d-41e4-895e-562287999946', 1, 2000, 800, 'Efectivo', 'Mariana (wsp)', '2026-07-15', 'Importado del Excel (fila Id 24)');
insert into ventas (talle_id, cantidad, valor_abonado, valor_costo, forma_pago, cliente, fecha, nota) values ('e97239c9-1037-435b-a290-4e050cf643e8', 1, 2000, 1300, 'Transferencia', 'Maxi Viera', '2026-07-14', 'Importado del Excel (fila Id 25)');
insert into ventas (talle_id, cantidad, valor_abonado, valor_costo, forma_pago, cliente, fecha, nota) values ('93f0efeb-91b0-459a-85cd-3e9a7e724f08', 1, 2000, 1300, 'Transferencia', 'Juan Pablo Besio', '2026-07-17', 'Importado del Excel (fila Id 26)');
insert into ventas (talle_id, cantidad, valor_abonado, valor_costo, forma_pago, cliente, fecha, nota) values ('1113852d-ef7b-4692-abd7-52e253c5567a', 1, 2000, 1300, 'Transferencia', 'Juan Pablo Besio', '2026-07-17', 'Importado del Excel (fila Id 27)');
insert into ventas (talle_id, cantidad, valor_abonado, valor_costo, forma_pago, cliente, fecha, nota) values ('5f2813df-5bd1-410d-9c66-8a1dc9bd9fc3', 1, 2000, 1200, 'Transferencia', 'Laura Díaz', '2026-07-22', 'Importado del Excel (fila Id 28)');
insert into ventas (talle_id, cantidad, valor_abonado, valor_costo, forma_pago, cliente, fecha, nota) values ('a8a41175-92ba-4778-80fb-2516fc30c8fb', 1, 2600, 1700, 'Transferencia', 'Gianina', '2026-08-07', 'Importado del Excel (fila Id 30)');
insert into ventas (talle_id, cantidad, valor_abonado, valor_costo, forma_pago, cliente, fecha, nota) values ('60b013c7-2509-4520-9b20-92dad0a7ede0', 1, 2000, 1300, 'Transferencia', 'Rocío Orange', '2026-08-11', 'Importado del Excel (fila Id 31)');
insert into ventas (talle_id, cantidad, valor_abonado, valor_costo, forma_pago, cliente, fecha, nota) values ('573f96e8-25ad-4d41-a5b6-7ecdc1a1f15a', 1, 2000, 800, 'Efectivo', 'Tiktok', '2026-08-23', 'Importado del Excel (fila Id 32)');