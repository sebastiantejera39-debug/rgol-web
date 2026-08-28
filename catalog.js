/* ===== RGOL.UY — Catálogo dinámico (Supabase) =====
   Reemplaza las fichas de producto escritas a mano: las trae de la base de datos
   y arma el mismo HTML/clases que ya usan el resto de los scripts de la página
   (carrusel, talles, lightbox, carrito), así que esos scripts no cambian.
*/
(function () {
  const SUPA_URL = 'https://ncaxykzdnunherbkueed.supabase.co';
  const SUPA_KEY = 'sb_publishable_svxqK1bZf7HR8kAWAAQwJw_QDHQHeNZ';

  function formatPrice(n) {
    if (n === null || n === undefined) return '';
    return '$' + Math.round(n).toString().replace(/\B(?=(\d{3})+(?!\d))/g, '.');
  }

  function esc(s) {
    const d = document.createElement('div');
    d.textContent = s === null || s === undefined ? '' : String(s);
    return d.innerHTML;
  }

  async function fetchJSON(path, opts) {
    const res = await fetch(SUPA_URL + path, Object.assign({
      headers: { apikey: SUPA_KEY, Authorization: 'Bearer ' + SUPA_KEY, 'Content-Type': 'application/json' },
    }, opts || {}));
    if (!res.ok) throw new Error('Supabase error ' + res.status + ' en ' + path);
    return res.json();
  }

  async function fetchStockMap() {
    const rows = await fetchJSON('/rest/v1/rpc/stock_publico', { method: 'POST', body: '{}' });
    const map = {};
    rows.forEach(r => { map[r.producto_id + '|' + r.talle] = r.disponible; });
    return map;
  }

  function cardHTML(p, idx, stockMap, dataAttrHTML) {
    const id = 'prod' + idx;
    const imgs = (p.imagenes || []).map(src => `<img src="${esc(src)}" alt="${esc(p.nombre)}" loading="lazy">`).join('');
    const dots = (p.imagenes || []).length > 1
      ? `<div class="carousel-dots">${(p.imagenes || []).map((_, i) => `<div class="carousel-dot${i === 0 ? ' active' : ''}"></div>`).join('')}</div>`
      : '';
    const navBtns = (p.imagenes || []).length > 1
      ? `<button class="carousel-btn prev" onclick="moveCarousel('${id}',-1)">‹</button><button class="carousel-btn next" onclick="moveCarousel('${id}',1)">›</button>`
      : '';
    const badge = p.badge ? `<span class="badge">${esc(p.badge)}</span>` : '';
    const priceOld = p.precio_oferta ? `<span class="price-old">${formatPrice(p.precio_oferta)}</span>` : '';
    const sizesHTML = (p.talles || []).map(t => {
      const disponible = stockMap[p.id + '|' + t.talle] !== false;
      const cls = disponible ? 'size-btn' : 'size-btn agotado';
      return `<button class="${cls}" onclick="selectSize(this)">${esc(t.talle)}</button>`;
    }).join('');

    return `
    <div class="product-card" ${dataAttrHTML}>
      <div class="carousel" id="${id}">
        ${badge}
        <div class="carousel-track">${imgs}</div>
        ${navBtns}
        ${dots}
      </div>
      <div class="product-info">
        <div class="product-league">${esc(p.liga || '')}</div>
        <div class="product-name">${esc(p.nombre)}</div>
        <div class="product-price"><span class="price-current">${formatPrice(p.precio)}</span>${priceOld}</div>
        <div class="sizes-label">Talle</div>
        <div class="sizes">${sizesHTML}</div>
      </div>
      <div class="product-footer"><button class="btn-buy" data-producto="${esc(p.nombre)}">Agregar al carrito</button></div>
    </div>`;
  }

  function wireBuyButtons(container) {
    container.querySelectorAll('.btn-buy').forEach(btn => {
      btn.addEventListener('click', () => {
        if (typeof addToCart === 'function') addToCart(btn.dataset.producto, btn);
      });
    });
  }

  function wireLightbox(container) {
    container.querySelectorAll('.carousel-track img').forEach(img => {
      img.addEventListener('click', () => {
        if (typeof openLightbox === 'function') openLightbox(img);
      });
    });
  }

  // ---- Modo A: catalogo.html (todos los productos, filtro doble tipo+región) ----
  async function renderCatalogoCompleto(containerSelector) {
    const container = document.querySelector(containerSelector);
    if (!container) return;
    try {
      const [productos, stockMap] = await Promise.all([
        fetchJSON('/rest/v1/productos?select=*,talles(*)&activo=eq.true&order=nombre'),
        fetchStockMap(),
      ]);
      container.innerHTML = productos.map((p, i) => {
        const attrs = `data-tipo="${esc(p.tipo || '')}" data-region="${esc(p.region || '')}"`;
        return cardHTML(p, i, stockMap, attrs);
      }).join('');
      wireBuyButtons(container);
      wireLightbox(container);
      if (typeof applyFilters === 'function') applyFilters();
      const countEl = document.getElementById('count');
      if (countEl && typeof applyFilters !== 'function') countEl.textContent = productos.length;
    } catch (err) {
      container.innerHTML = '<p style="color:var(--text-muted)">No se pudo cargar el catálogo. Probá recargar la página.</p>';
      console.error(err);
    }
  }

  // ---- Modo B: equipos / selecciones / retro (filtradas por categoría, un solo data-cat) ----
  async function renderCategoria(containerSelector, categoria, catColumn) {
    const container = document.querySelector(containerSelector);
    if (!container) return;
    try {
      const [productos, stockMap] = await Promise.all([
        fetchJSON(`/rest/v1/productos?select=*,talles(*)&activo=eq.true&categorias=cs.{${categoria}}&order=nombre`),
        fetchStockMap(),
      ]);
      container.innerHTML = productos.map((p, i) => {
        const cat = p[catColumn];
        const attrs = `data-cat="${esc(cat || '')}"`;
        return cardHTML(p, i, stockMap, attrs);
      }).join('');
      wireBuyButtons(container);
      wireLightbox(container);
    } catch (err) {
      container.innerHTML = '<p style="color:var(--text-muted)">No se pudo cargar el catálogo. Probá recargar la página.</p>';
      console.error(err);
    }
  }

  window.RGOLCatalog = { renderCatalogoCompleto, renderCategoria };
})();
