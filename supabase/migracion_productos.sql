-- Migración de datos: productos + talles desde el sitio actual (catalogo.html)
-- Genera automáticamente stock_inicial: 0 si el talle ya estaba marcado 'agotado' en el sitio, 1 si no.

do $$
declare
  pid uuid;
begin
  insert into productos (nombre, liga, categorias, precio, precio_oferta, badge, imagenes)
    values ('Real Madrid · Titular 25/26', 'La Liga · España', ARRAY['equipos']::text[], 2100, null, null, ARRAY['RealMadrid_Titular2526_1.jpg','RealMadrid_Titular2526_2.jpg','RealMadrid_Titular2526_3.jpg']::text[])
    returning id into pid;
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'M', 1);
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'L', 1);

  insert into productos (nombre, liga, categorias, precio, precio_oferta, badge, imagenes)
    values ('Real Madrid · Retro 2008', 'La Liga · España · 2008', ARRAY['retro']::text[], 2625, null, 'Retro', ARRAY['RealMadrid_Retro2008_1.jpg','RealMadrid_Retro2008_2.jpg']::text[])
    returning id into pid;
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'L', 1);

  insert into productos (nombre, liga, categorias, precio, precio_oferta, badge, imagenes)
    values ('Argentina · Titular 25/26', 'Sudamérica', ARRAY['selecciones']::text[], 2100, null, null, ARRAY['Argentina_Titular2526_1.jpg','Argentina_Titular2526_2.jpg','Argentina_Titular2526_3.jpg']::text[])
    returning id into pid;
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'M', 1);
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'L', 1);

  insert into productos (nombre, liga, categorias, precio, precio_oferta, badge, imagenes)
    values ('Argentina · Visitante 25/26', 'Sudamérica', ARRAY['selecciones']::text[], 2100, null, null, ARRAY['Argentina_VisitanteJugador2526_1.jpg','Argentina_VisitanteJugador2526_2.jpg','Argentina_VisitanteJugador2526_3.jpg']::text[])
    returning id into pid;
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'M', 1);
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'L', 1);

  insert into productos (nombre, liga, categorias, precio, precio_oferta, badge, imagenes)
    values ('Argentina · Edición especial', 'Sudamérica · Edición especial', ARRAY['selecciones','retro']::text[], 2625, null, 'Retro', ARRAY['Argentina_EdicionEspecial_1.jpg','Argentina_EdicionEspecial_2.jpg','Argentina_EdicionEspecial_3.jpg']::text[])
    returning id into pid;
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'M', 1);

  insert into productos (nombre, liga, categorias, precio, precio_oferta, badge, imagenes)
    values ('Alemania · Visitante 25/26', 'Europa · Alemania', ARRAY['selecciones']::text[], 2100, null, null, ARRAY['Alemania_Visitante2526_1.jpg','Alemania_Visitante2526_2.jpg']::text[])
    returning id into pid;
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'S', 1);
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'M', 1);
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'L', 1);

  insert into productos (nombre, liga, categorias, precio, precio_oferta, badge, imagenes)
    values ('Alemania · Tercera 25/26 Black', 'Europa · Alemania', ARRAY['selecciones']::text[], 2100, null, null, ARRAY['Alemania_Tercera2526Black_1.jpg','Alemania_Tercera2526Black_2.jpg','Alemania_Tercera2526Black_3.jpg']::text[])
    returning id into pid;
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'S', 1);
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'M', 1);
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'L', 1);
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'XL', 1);

  insert into productos (nombre, liga, categorias, precio, precio_oferta, badge, imagenes)
    values ('España · Visitante 25/26', 'Europa · España', ARRAY['selecciones']::text[], 2100, null, null, ARRAY['Espana_Visitante2526_1.jpg','Espana_Visitante2526_2.jpg','Espana_Visitante2526_3.jpg']::text[])
    returning id into pid;
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'S', 1);
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'M', 1);
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'L', 1);
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'XL', 1);

  insert into productos (nombre, liga, categorias, precio, precio_oferta, badge, imagenes)
    values ('Manchester United · Titular 08 Manga Larga Ronaldo 7', 'Premier League · 2008', ARRAY['retro']::text[], 2625, null, 'Agotado', ARRAY['ManchesterUnited_Titular08MangaLarga_1.jpg','ManchesterUnited_Titular08MangaLarga_2.jpg','ManchesterUnited_Titular08MangaLarga_3.jpg']::text[])
    returning id into pid;
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'L', 0);

  insert into productos (nombre, liga, categorias, precio, precio_oferta, badge, imagenes)
    values ('Liverpool · Titular 25/26 Champions', 'Premier League · Inglaterra', ARRAY['equipos']::text[], 2100, null, null, ARRAY['Liverpool_Titular2526Champions_1.jpg','Liverpool_Titular2526Champions_12.jpg']::text[])
    returning id into pid;
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'M', 1);

  insert into productos (nombre, liga, categorias, precio, precio_oferta, badge, imagenes)
    values ('Liverpool · Titular 25/26', 'Premier League · Inglaterra', ARRAY['equipos']::text[], 2100, null, null, ARRAY['Liverpool_Titular2526_1.jpg','Liverpool_Titular2526_2.jpg']::text[])
    returning id into pid;
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'M', 1);
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'L', 1);

  insert into productos (nombre, liga, categorias, precio, precio_oferta, badge, imagenes)
    values ('Liverpool · Visitante 25/26', 'Premier League · Inglaterra', ARRAY['equipos']::text[], 2100, null, null, ARRAY['Liverpool_Visitante2526_1.jpg','Liverpool_Visitante2526_2.jpg']::text[])
    returning id into pid;
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'L', 1);

  insert into productos (nombre, liga, categorias, precio, precio_oferta, badge, imagenes)
    values ('Manchester City · Tercera 2024', 'Premier League · Edición especial', ARRAY['equipos','retro']::text[], 2625, null, 'Retro', ARRAY['ManchesterCity_Tercera2024_1.jpg','ManchesterCity_Tercera2024_2.jpg','ManchesterCity_Tercera2024_3.jpg']::text[])
    returning id into pid;
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'M', 1);

  insert into productos (nombre, liga, categorias, precio, precio_oferta, badge, imagenes)
    values ('Manchester City · Titular 2025', 'Premier League · Inglaterra', ARRAY['equipos']::text[], 2100, null, null, ARRAY['ManchesterCity_Titular2025_1.jpg','ManchesterCity_Titular2025_2.jpg']::text[])
    returning id into pid;
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'L', 1);

  insert into productos (nombre, liga, categorias, precio, precio_oferta, badge, imagenes)
    values ('Manchester City · Tercera 2025', 'Premier League · Inglaterra', ARRAY['equipos']::text[], 2100, null, null, ARRAY['ManchesterCity_Tercera2025_1.jpg','ManchesterCity_Tercera2025_2.jpg']::text[])
    returning id into pid;
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'XL', 1);
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'M', 1);

  insert into productos (nombre, liga, categorias, precio, precio_oferta, badge, imagenes)
    values ('Italia · Titular 2025', 'Europa · Italia', ARRAY['selecciones']::text[], 2100, null, null, ARRAY['Italia_Titular2025_1.jpg','Italia_Titular2025_2.jpg']::text[])
    returning id into pid;
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'M', 1);

  insert into productos (nombre, liga, categorias, precio, precio_oferta, badge, imagenes)
    values ('Colombia · Edición especial', 'Sudamérica · Colombia', ARRAY['selecciones']::text[], 1575, 2100, 'Sale', ARRAY['Colombia_EdicionEspecial_1.jpg','Colombia_EdicionEspecial_2.jpg','Colombia_EdicionEspecial_3.jpg']::text[])
    returning id into pid;
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'L', 1);

  insert into productos (nombre, liga, categorias, precio, precio_oferta, badge, imagenes)
    values ('PSG · Titular 2025', 'Ligue 1 · Francia', ARRAY['equipos']::text[], 2100, null, null, ARRAY['PSG_Titular2025_1.jpg','PSG_Titular2025_2.jpg']::text[])
    returning id into pid;
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'M', 1);

  insert into productos (nombre, liga, categorias, precio, precio_oferta, badge, imagenes)
    values ('Barcelona · Retro 1994 Ronaldo 9', 'La Liga · España · 1994', ARRAY['retro']::text[], 2625, null, 'Agotado', ARRAY['Barcelona_Retro1994Ronaldo9_1.jpg','Barcelona_Retro1994Ronaldo9_2.jpg','Barcelona_Retro1994Ronaldo9_3.jpg']::text[])
    returning id into pid;
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'XL', 0);

  insert into productos (nombre, liga, categorias, precio, precio_oferta, badge, imagenes)
    values ('Nottingham Forest · Titular 25/26', 'Premier League · Inglaterra', ARRAY['equipos']::text[], 2100, null, null, ARRAY['NottinghamForest_Titular2526_1.jpg','NottinghamForest_Titular2526_2.jpg']::text[])
    returning id into pid;
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'L', 1);

  insert into productos (nombre, liga, categorias, precio, precio_oferta, badge, imagenes)
    values ('Brasil · Titular 26/27', 'Sudamérica · Brasil', ARRAY['selecciones']::text[], 2100, null, null, ARRAY['Brasil_Titular2627_1.jpg','Brasil_Titular2627_1.jpg','Brasil_Titular2627_3.jpg']::text[])
    returning id into pid;
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'S', 1);
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'M', 1);

  insert into productos (nombre, liga, categorias, precio, precio_oferta, badge, imagenes)
    values ('Santos · Titular 2011', 'Serie A Brasil · 2011', ARRAY['equipos','retro']::text[], 2625, null, 'Retro', ARRAY['Santos_Titular2011_1.jpg','Santos_Titular2011_2.jpg']::text[])
    returning id into pid;
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'L', 1);

  insert into productos (nombre, liga, categorias, precio, precio_oferta, badge, imagenes)
    values ('Flamengo · Visitante 26/27', 'Serie A · Brasil', ARRAY['equipos']::text[], 2100, null, null, ARRAY['Flamengo_Visitante2627_1.jpg','Flamengo_Visitante2627_2.jpg']::text[])
    returning id into pid;
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'S', 1);
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'M', 1);
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'L', 1);
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'XL', 1);
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'XXL', 1);

  insert into productos (nombre, liga, categorias, precio, precio_oferta, badge, imagenes)
    values ('Corinthians · Titular 25 Memphis 10', 'Serie A · Brasil', ARRAY['equipos']::text[], 1575, 2100, 'Sale', ARRAY['Corinthians_Titular25_1.jpg','Corinthians_Titular25_2.jpg','Corinthians_Titular25_3.jpg']::text[])
    returning id into pid;
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'L', 1);

  insert into productos (nombre, liga, categorias, precio, precio_oferta, badge, imagenes)
    values ('Colombia · Titular 2024', 'Sudamérica · Colombia', ARRAY['selecciones']::text[], 1575, 2100, 'Sale', ARRAY['Colombia_Titular24_1.jpg','Colombia_Titular24_2.jpg','Colombia_Titular24_3.jpg']::text[])
    returning id into pid;
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'XL', 1);

  insert into productos (nombre, liga, categorias, precio, precio_oferta, badge, imagenes)
    values ('USA · Titular 2025', 'Norteamérica', ARRAY['selecciones']::text[], 2100, null, null, ARRAY['USA_Titular2025_1.jpg','USA_Titular2025_2.jpg']::text[])
    returning id into pid;
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'XL', 1);

  insert into productos (nombre, liga, categorias, precio, precio_oferta, badge, imagenes)
    values ('Arsenal · Tercera 2025', 'Premier League · Inglaterra', ARRAY['equipos']::text[], 2100, null, 'Agotado', ARRAY['Arsenal_Tercera2025_1.jpg','Arsenal_Tercera2025_2.jpg','Arsenal_Tercera2025_3.jpg']::text[])
    returning id into pid;
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'M', 0);

  insert into productos (nombre, liga, categorias, precio, precio_oferta, badge, imagenes)
    values ('Inter Miami · Titular 25/26', 'MLS · Estados Unidos', ARRAY['equipos']::text[], 2100, null, null, ARRAY['InterMiami_Titular2526_1.jpg','InterMiami_Titular2526_2.jpg']::text[])
    returning id into pid;
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'L', 1);

  insert into productos (nombre, liga, categorias, precio, precio_oferta, badge, imagenes)
    values ('Palmeiras · Titular 24/25', 'Serie A · Brasil', ARRAY['equipos']::text[], 1575, 2100, 'Sale', ARRAY['Palmeiras_Titular2425_1.jpg','Palmeiras_Titular2425_2.jpg','Palmeiras_Titular2425_3.jpg']::text[])
    returning id into pid;
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'S', 1);

  insert into productos (nombre, liga, categorias, precio, precio_oferta, badge, imagenes)
    values ('Alemania · Titular 25/26', 'Europa', ARRAY['selecciones']::text[], 2100, null, null, ARRAY['Alemania_Titular2526_1.jpg','Alemania_Titular2526_2.jpg']::text[])
    returning id into pid;
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'S', 1);
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'M', 1);
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'L', 1);
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'XL', 1);
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'XXL', 1);

  insert into productos (nombre, liga, categorias, precio, precio_oferta, badge, imagenes)
    values ('PSG · Visitante 25/26', 'Ligue 1 · Francia', ARRAY['equipos']::text[], 2100, null, null, ARRAY['PSG_Visitante2526_1.jpg']::text[])
    returning id into pid;
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'S', 1);
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'M', 1);
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'L', 1);
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'XXL', 1);

  insert into productos (nombre, liga, categorias, precio, precio_oferta, badge, imagenes)
    values ('Barcelona · Tercera 19/20 · Messi 10', 'La Liga · España', ARRAY['retro']::text[], 2625, null, 'Agotado', ARRAY['Barcelona_Tercera1920Messi10_2.jpg']::text[])
    returning id into pid;
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'Consultar', 0);

  insert into productos (nombre, liga, categorias, precio, precio_oferta, badge, imagenes)
    values ('Nacional Uruguay · Titular', 'Liga Uruguay', ARRAY['equipos']::text[], 2100, null, null, ARRAY['Nacional_Titular_1.jpg']::text[])
    returning id into pid;
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'S', 1);
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'M', 1);
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'L', 1);
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'XL', 1);
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'XXL', 1);
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'XXXL', 1);

  insert into productos (nombre, liga, categorias, precio, precio_oferta, badge, imagenes)
    values ('Portugal · Visitante 25/26', 'Europa', ARRAY['selecciones']::text[], 2100, null, null, ARRAY['Portugal_Visitante2526_1.jpg']::text[])
    returning id into pid;
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'S', 1);
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'M', 1);
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'L', 1);
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'XL', 1);
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'XXL', 1);
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'XXXL', 1);

  insert into productos (nombre, liga, categorias, precio, precio_oferta, badge, imagenes)
    values ('AC Milan · Titular 24/25', 'Serie A · Italia', ARRAY['equipos']::text[], 2100, null, null, ARRAY['ACMilan_Titular2425_1.jpg']::text[])
    returning id into pid;
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'S', 1);
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'M', 1);
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'L', 1);
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'XL', 1);

  insert into productos (nombre, liga, categorias, precio, precio_oferta, badge, imagenes)
    values ('Barcelona · Titular 24/25', 'La Liga · España', ARRAY['equipos']::text[], 2100, null, 'Agotado', ARRAY['Barcelona_Titular2425_1.jpg']::text[])
    returning id into pid;
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'Consultar', 0);

  insert into productos (nombre, liga, categorias, precio, precio_oferta, badge, imagenes)
    values ('Francia · Titular 25/26', 'Europa', ARRAY['selecciones']::text[], 2100, null, null, ARRAY['Francia_Titular2526_1.jpg','Francia_Titular2526_2.jpg']::text[])
    returning id into pid;
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'M', 1);
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'L', 1);
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'XL', 1);

  insert into productos (nombre, liga, categorias, precio, precio_oferta, badge, imagenes)
    values ('Liverpool · Retro Adidas', 'Premier League', ARRAY['equipos']::text[], 2625, null, 'Agotado', ARRAY['Liverpool_RetroAdidas_1.jpg']::text[])
    returning id into pid;
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'Consultar', 0);

  insert into productos (nombre, liga, categorias, precio, precio_oferta, badge, imagenes)
    values ('Brasil · Retro 2004 · Kaká 8', 'Sudamérica · 2004', ARRAY['selecciones','retro']::text[], 2625, null, 'Agotado', ARRAY['Brasil_Retro2004Kaka8_1.jpg','Brasil_Retro2004Kaka8_2.jpg']::text[])
    returning id into pid;
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'Consultar', 0);

  insert into productos (nombre, liga, categorias, precio, precio_oferta, badge, imagenes)
    values ('Barcelona · Travis Scott', 'La Liga · España', ARRAY['equipos']::text[], 2100, null, 'Agotado', ARRAY['Barcelona_TravisScott_1.jpg']::text[])
    returning id into pid;
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'Consultar', 0);

  insert into productos (nombre, liga, categorias, precio, precio_oferta, badge, imagenes)
    values ('Inglaterra · Titular 25/26', 'Europa', ARRAY['selecciones']::text[], 2100, null, null, ARRAY['Inglaterra_Titular2526_1.jpg']::text[])
    returning id into pid;
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'S', 1);
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'M', 1);
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'L', 1);
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'XL', 1);
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'XXL', 1);

  insert into productos (nombre, liga, categorias, precio, precio_oferta, badge, imagenes)
    values ('Japón · Retro 2000', 'Asia · 2000', ARRAY['selecciones','retro']::text[], 2625, null, 'Retro', ARRAY['Japon_Retro2000_1.jpg']::text[])
    returning id into pid;
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'M', 1);
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'L', 1);

  insert into productos (nombre, liga, categorias, precio, precio_oferta, badge, imagenes)
    values ('PSG · Retro 16/17 · Neymar', 'Ligue 1 · Francia', ARRAY['retro']::text[], 2625, null, 'Agotado', ARRAY['PSG_Retro1617_1.jpg','PSG_Retro1617_2.jpg']::text[])
    returning id into pid;
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'Consultar', 0);

  insert into productos (nombre, liga, categorias, precio, precio_oferta, badge, imagenes)
    values ('Barcelona · Kobe Negro', 'La Liga · España', ARRAY['equipos']::text[], 2100, null, 'Agotado', ARRAY['Barcelona_KobeNegro_1.jpg']::text[])
    returning id into pid;
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'Consultar', 0);

  insert into productos (nombre, liga, categorias, precio, precio_oferta, badge, imagenes)
    values ('México · Visitante 2026', 'Norteamérica', ARRAY['selecciones']::text[], 2100, null, 'Agotado', ARRAY['Mexico_Visitante_1.jpg']::text[])
    returning id into pid;
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'Consultar', 0);

  insert into productos (nombre, liga, categorias, precio, precio_oferta, badge, imagenes)
    values ('Jamaica · Retro Verde', 'Caribe', ARRAY['selecciones','retro']::text[], 2625, null, 'Agotado', ARRAY['Jamaica_Retro_1.jpg']::text[])
    returning id into pid;
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'Consultar', 0);

  insert into productos (nombre, liga, categorias, precio, precio_oferta, badge, imagenes)
    values ('Inglaterra · Tercera 25/26', 'Europa', ARRAY['selecciones']::text[], 2100, null, 'Agotado', ARRAY['Inglaterra_Tercera2526_1.jpg','Inglaterra_Tercera2526_2.jpg']::text[])
    returning id into pid;
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'Consultar', 0);

  insert into productos (nombre, liga, categorias, precio, precio_oferta, badge, imagenes)
    values ('Barcelona · Retro 10/11 · Unicef', 'La Liga · España', ARRAY['retro']::text[], 2625, null, 'Retro', ARRAY['Barcelona_Retro1011_1.jpg']::text[])
    returning id into pid;
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'S', 1);
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'L', 1);
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'XXL', 1);

  insert into productos (nombre, liga, categorias, precio, precio_oferta, badge, imagenes)
    values ('Bélgica · Titular 2022', 'Europa · 2022', ARRAY['selecciones']::text[], 2100, null, null, ARRAY['Belgica_Titular22_1.jpg','Belgica_Titular22_2.jpg']::text[])
    returning id into pid;
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'S', 1);
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'M', 1);
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'L', 1);
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'XL', 1);
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'XXL', 1);
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'XXXL', 1);

  insert into productos (nombre, liga, categorias, precio, precio_oferta, badge, imagenes)
    values ('Real Madrid · Retro 80s', 'La Liga · España', ARRAY['retro']::text[], 2625, null, 'Agotado', ARRAY['RealMadrid_Retro80s_1.jpg']::text[])
    returning id into pid;
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'Consultar', 0);

  insert into productos (nombre, liga, categorias, precio, precio_oferta, badge, imagenes)
    values ('Argentina · Visitante 2026', 'Sudamérica', ARRAY['selecciones']::text[], 2100, null, null, ARRAY['Argentina_Visitante2026_1.jpg']::text[])
    returning id into pid;
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'M', 1);
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'L', 1);

  insert into productos (nombre, liga, categorias, precio, precio_oferta, badge, imagenes)
    values ('Chelsea · Titular 24/25', 'Premier League', ARRAY['equipos']::text[], 2100, null, null, ARRAY['Chelsea_Titular2425_1.jpg','Chelsea_Titular2425_2.jpg']::text[])
    returning id into pid;
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'M', 1);

  insert into productos (nombre, liga, categorias, precio, precio_oferta, badge, imagenes)
    values ('Brasil · Visitante Jordan', 'Sudamérica', ARRAY['selecciones']::text[], 2100, null, null, ARRAY['Brasil_Visitante_1.jpg']::text[])
    returning id into pid;
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'S', 1);
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'M', 1);
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'L', 1);
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'XL', 1);
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'XXL', 1);
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'XXXL', 1);

  insert into productos (nombre, liga, categorias, precio, precio_oferta, badge, imagenes)
    values ('Inter Milan · Titular 24/25', 'Serie A · Italia', ARRAY['equipos']::text[], 2100, null, null, ARRAY['InterMilan_Titular2425_1.jpg']::text[])
    returning id into pid;
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'M', 1);
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'L', 1);
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'XL', 1);

  insert into productos (nombre, liga, categorias, precio, precio_oferta, badge, imagenes)
    values ('Inter Milan · Visitante 24/25', 'Serie A · Italia', ARRAY['equipos']::text[], 2100, null, null, ARRAY['InterMilan_Visitante2425_1.jpg']::text[])
    returning id into pid;
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'S', 1);
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'M', 1);
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'L', 1);
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'XL', 1);
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'XXL', 1);

  insert into productos (nombre, liga, categorias, precio, precio_oferta, badge, imagenes)
    values ('Boca Juniors · 120 Aniversario', 'Liga Argentina', ARRAY['equipos']::text[], 2100, null, null, ARRAY['BocaJuniors_120Aniversario_1.jpg']::text[])
    returning id into pid;
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'S', 1);
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'M', 1);
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'L', 1);
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'XL', 1);
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'XXL', 1);
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'XXXL', 1);

  insert into productos (nombre, liga, categorias, precio, precio_oferta, badge, imagenes)
    values ('Arsenal · Titular Manga Larga', 'Premier League', ARRAY['equipos']::text[], 2100, null, 'Agotado', ARRAY['Arsenal_TitularMangaLarga_1.jpg']::text[])
    returning id into pid;
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'Consultar', 0);

  insert into productos (nombre, liga, categorias, precio, precio_oferta, badge, imagenes)
    values ('Al Nassr · Visitante Manga Larga', 'Pro League Arabia', ARRAY['equipos']::text[], 2100, null, 'Agotado', ARRAY['AlNassr_Visitante_1.jpg']::text[])
    returning id into pid;
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'Consultar', 0);

  insert into productos (nombre, liga, categorias, precio, precio_oferta, badge, imagenes)
    values ('Portugal · Titular 25/26', 'Europa', ARRAY['selecciones']::text[], 2100, null, null, ARRAY['Portugal_Titular2526_1.jpg']::text[])
    returning id into pid;
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'S', 1);
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'M', 1);
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'L', 1);
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'XL', 1);
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'XXL', 1);
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'XXXL', 1);

  insert into productos (nombre, liga, categorias, precio, precio_oferta, badge, imagenes)
    values ('Peñarol · Titular', 'Liga Uruguay', ARRAY['equipos']::text[], 2100, null, null, ARRAY['Penarol_Titular_1.jpg']::text[])
    returning id into pid;
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'S', 1);
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'M', 1);
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'L', 1);
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'XL', 1);
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'XXL', 1);

  insert into productos (nombre, liga, categorias, precio, precio_oferta, badge, imagenes)
    values ('Real Betis · × Naruto', 'La Liga · España', ARRAY['equipos']::text[], 2100, null, 'Agotado', ARRAY['RealBetis_Naruto_1.jpg']::text[])
    returning id into pid;
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'Consultar', 0);

  insert into productos (nombre, liga, categorias, precio, precio_oferta, badge, imagenes)
    values ('Palmeiras · Titular 25/26', 'Serie A · Brasil', ARRAY['equipos']::text[], 2100, null, null, ARRAY['Palmeiras_Titular2526_1.jpg']::text[])
    returning id into pid;
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'M', 1);

  insert into productos (nombre, liga, categorias, precio, precio_oferta, badge, imagenes)
    values ('Chile · Titular', 'Sudamérica', ARRAY['selecciones']::text[], 2100, null, null, ARRAY['Chile_Titular_1.jpg','Chile_Titular_2.jpg']::text[])
    returning id into pid;
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'S', 1);
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'M', 1);
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'L', 1);
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'XL', 1);
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'XXL', 1);
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'XXXL', 1);

  insert into productos (nombre, liga, categorias, precio, precio_oferta, badge, imagenes)
    values ('Al Nassr · Titular', 'Pro League Arabia', ARRAY['equipos']::text[], 2100, null, 'Agotado', ARRAY['AlNassr_Titular_1.jpg']::text[])
    returning id into pid;
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'Consultar', 0);

  insert into productos (nombre, liga, categorias, precio, precio_oferta, badge, imagenes)
    values ('Nigeria · Visitante', 'África', ARRAY['selecciones']::text[], 2100, null, null, ARRAY['Nigeria_Visitante_1.jpg']::text[])
    returning id into pid;
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'S', 1);
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'M', 1);
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'XXL', 1);

  insert into productos (nombre, liga, categorias, precio, precio_oferta, badge, imagenes)
    values ('Atlético Madrid · Visitante', 'La Liga · España', ARRAY['equipos']::text[], 2100, null, 'Agotado', ARRAY['AtleticoMadrid_Visitante_1.jpg','AtleticoMadrid_Visitante_2.jpg']::text[])
    returning id into pid;
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'Consultar', 0);

  insert into productos (nombre, liga, categorias, precio, precio_oferta, badge, imagenes)
    values ('PSG · Titular 23/24', 'Ligue 1 · Francia', ARRAY['equipos']::text[], 2100, null, null, ARRAY['PSG_Titular2324_1.jpg']::text[])
    returning id into pid;
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'S', 1);
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'M', 1);
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'L', 1);
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'XL', 1);

  insert into productos (nombre, liga, categorias, precio, precio_oferta, badge, imagenes)
    values ('Francia · Titular 25/26 · Nº7', 'Europa', ARRAY['selecciones']::text[], 2100, null, null, ARRAY['Francia_Titular2526_No7_1.jpg']::text[])
    returning id into pid;
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'S', 1);
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'M', 1);
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'L', 1);
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'XL', 1);

  insert into productos (nombre, liga, categorias, precio, precio_oferta, badge, imagenes)
    values ('Francia · Retro 1998 · Zidane 10', 'Europa · 1998', ARRAY['selecciones','retro']::text[], 2625, null, 'Retro', ARRAY['Francia_Retro1998Zidane10_1.jpg','Francia_Retro1998Zidane10_2.jpg']::text[])
    returning id into pid;
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'S', 1);
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'M', 1);
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'L', 1);
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'XL', 1);
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'XXL', 1);
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'XXXL', 1);

  insert into productos (nombre, liga, categorias, precio, precio_oferta, badge, imagenes)
    values ('Italia · Titular 24/25', 'Europa', ARRAY['selecciones']::text[], 2100, null, null, ARRAY['Italia_Titular2425_1.jpg']::text[])
    returning id into pid;
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'S', 1);
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'M', 1);
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'L', 1);
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'XL', 1);
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'XXL', 1);

  insert into productos (nombre, liga, categorias, precio, precio_oferta, badge, imagenes)
    values ('México · Titular', 'Norteamérica', ARRAY['selecciones']::text[], 2100, null, null, ARRAY['Mexico_Titular_1.jpg']::text[])
    returning id into pid;
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'S', 1);
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'M', 1);
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'L', 1);
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'XL', 1);
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'XXL', 1);
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'XXXL', 1);

  insert into productos (nombre, liga, categorias, precio, precio_oferta, badge, imagenes)
    values ('España · Titular 2022', 'Europa · 2022', ARRAY['selecciones']::text[], 2100, null, null, ARRAY['Espana_Titular22_1.jpg','Espana_Titular22_2.jpg']::text[])
    returning id into pid;
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'S', 1);
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'M', 1);
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'L', 1);
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'XL', 1);
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'XXL', 1);

  insert into productos (nombre, liga, categorias, precio, precio_oferta, badge, imagenes)
    values ('Manchester United · Retro Visitante 98', 'Premier League', ARRAY['retro']::text[], 2625, null, 'Agotado', ARRAY['ManchesterUnited_RetroVisitante98_1.jpg']::text[])
    returning id into pid;
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'Consultar', 0);

  insert into productos (nombre, liga, categorias, precio, precio_oferta, badge, imagenes)
    values ('Barcelona · Visitante 24/25', 'La Liga · España', ARRAY['equipos']::text[], 2100, null, null, ARRAY['Barcelona_Visitante2425_1.jpg','Barcelona_Visitante2425_2.jpg']::text[])
    returning id into pid;
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'M', 1);
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'L', 1);
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'XL', 1);
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'XXL', 1);

  insert into productos (nombre, liga, categorias, precio, precio_oferta, badge, imagenes)
    values ('Jamaica · Titular', 'Caribe', ARRAY['selecciones']::text[], 2100, null, 'Agotado', ARRAY['Jamaica_Titular_1.jpg']::text[])
    returning id into pid;
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'Consultar', 0);

  insert into productos (nombre, liga, categorias, precio, precio_oferta, badge, imagenes)
    values ('Inter Miami · Visitante', 'MLS', ARRAY['equipos']::text[], 2100, null, 'Agotado', ARRAY['InterMiami_Visitante_1.jpg']::text[])
    returning id into pid;
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'Consultar', 0);

  insert into productos (nombre, liga, categorias, precio, precio_oferta, badge, imagenes)
    values ('Inglaterra · Retro 1990', 'Europa · 1990', ARRAY['selecciones','retro']::text[], 2625, null, 'Agotado', ARRAY['Inglaterra_Retro1990_1.jpg','Inglaterra_Retro1990_2.jpg']::text[])
    returning id into pid;
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'Consultar', 0);

  insert into productos (nombre, liga, categorias, precio, precio_oferta, badge, imagenes)
    values ('Tottenham · Visitante', 'Premier League', ARRAY['equipos']::text[], 2100, null, 'Agotado', ARRAY['Tottenham_Visitante_1.jpg']::text[])
    returning id into pid;
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'Consultar', 0);

  insert into productos (nombre, liga, categorias, precio, precio_oferta, badge, imagenes)
    values ('Juventus · Retro 99 · Manga Larga', 'Serie A · Italia', ARRAY['retro']::text[], 2625, null, 'Agotado', ARRAY['Juventus_Retro99MangaLarga_1.jpg']::text[])
    returning id into pid;
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'Consultar', 0);

  insert into productos (nombre, liga, categorias, precio, precio_oferta, badge, imagenes)
    values ('Juventus · Titular 24/25', 'Serie A · Italia', ARRAY['equipos']::text[], 2100, null, null, ARRAY['Juventus_Titular2425_1.jpg']::text[])
    returning id into pid;
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'M', 1);
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'L', 1);

  insert into productos (nombre, liga, categorias, precio, precio_oferta, badge, imagenes)
    values ('Chelsea · Visitante 24/25', 'Premier League', ARRAY['equipos']::text[], 2100, null, null, ARRAY['Chelsea_Visitante2425_1.jpg','Chelsea_Visitante2425_2.jpg']::text[])
    returning id into pid;
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'S', 1);
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'M', 1);
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'L', 1);
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'XL', 1);

  insert into productos (nombre, liga, categorias, precio, precio_oferta, badge, imagenes)
    values ('Holanda · Visitante Mundial 2026', 'Europa', ARRAY['selecciones']::text[], 2100, null, null, ARRAY['Holanda_Visitante2026_1.jpg','Holanda_Visitante2026_2.jpg']::text[])
    returning id into pid;
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'M', 1);
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'L', 1);
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'XL', 1);

  insert into productos (nombre, liga, categorias, precio, precio_oferta, badge, imagenes)
    values ('Liverpool · Titular 24/25 · Mac Allister', 'Premier League', ARRAY['equipos']::text[], 2100, null, null, ARRAY['Liverpool_Titular2425MacAllister_1.jpg']::text[])
    returning id into pid;
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'S', 1);
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'M', 1);

  insert into productos (nombre, liga, categorias, precio, precio_oferta, badge, imagenes)
    values ('Napoli · Titular 24/25', 'Serie A · Italia', ARRAY['equipos']::text[], 2100, null, 'Agotado', ARRAY['Napoli_Titular2425_1.jpg']::text[])
    returning id into pid;
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'Consultar', 0);

  insert into productos (nombre, liga, categorias, precio, precio_oferta, badge, imagenes)
    values ('Uruguay · Titular 2026', 'Sudamérica', ARRAY['selecciones']::text[], 2100, null, null, ARRAY['Uruguay_Retro_1.jpg']::text[])
    returning id into pid;
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'S', 1);
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'M', 1);
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'L', 1);
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'XL', 1);
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'XXL', 1);
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'XXXL', 1);
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'XXXXL', 1);

  insert into productos (nombre, liga, categorias, precio, precio_oferta, badge, imagenes)
    values ('Barcelona · Retro 14/15 · Qatar', 'La Liga · España', ARRAY['retro']::text[], 2625, null, 'Agotado', ARRAY['Barcelona_Retro1415_1.jpg']::text[])
    returning id into pid;
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'Consultar', 0);

  insert into productos (nombre, liga, categorias, precio, precio_oferta, badge, imagenes)
    values ('Racing Santander · Titular', 'La Liga · España', ARRAY['equipos']::text[], 2100, null, 'Agotado', ARRAY['RacingSantander_Titular_1.jpg']::text[])
    returning id into pid;
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'Consultar', 0);

  insert into productos (nombre, liga, categorias, precio, precio_oferta, badge, imagenes)
    values ('Italia · Visitante 25/26', 'Europa', ARRAY['selecciones']::text[], 2100, null, null, ARRAY['Italia_Visitante2526_1.jpg']::text[])
    returning id into pid;
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'S', 1);
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'M', 1);
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'L', 1);
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'XL', 1);
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'XXL', 1);

  insert into productos (nombre, liga, categorias, precio, precio_oferta, badge, imagenes)
    values ('Manchester United · Retro Titular 98', 'Premier League', ARRAY['retro']::text[], 2625, null, 'Agotado', ARRAY['ManchesterUnited_RetroTitular98_1.jpg']::text[])
    returning id into pid;
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'Consultar', 0);

  insert into productos (nombre, liga, categorias, precio, precio_oferta, badge, imagenes)
    values ('Corea del Sur · Visitante', 'Asia', ARRAY['selecciones']::text[], 2100, null, 'Agotado', ARRAY['CoreaSur_Visitante_1.jpg']::text[])
    returning id into pid;
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'Consultar', 0);

  insert into productos (nombre, liga, categorias, precio, precio_oferta, badge, imagenes)
    values ('Tottenham · Titular', 'Premier League', ARRAY['equipos']::text[], 2100, null, 'Agotado', ARRAY['Tottenham_Titular_1.jpg']::text[])
    returning id into pid;
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'Consultar', 0);

  insert into productos (nombre, liga, categorias, precio, precio_oferta, badge, imagenes)
    values ('Noruega · Titular Jugador', 'Europa', ARRAY['selecciones']::text[], 2415, null, 'Agotado', ARRAY['Noruega_Titular_1.jpg','Noruega_Titular_2.jpg']::text[])
    returning id into pid;
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'M', 0);
  insert into talles (producto_id, talle, stock_inicial) values (pid, 'L', 0);

end $$;