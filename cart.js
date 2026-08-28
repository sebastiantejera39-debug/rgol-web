/* ===== RGOL.UY — Carrito (paso previo a checkout real) ===== */
(function () {
  const WHATSAPP_NUMBER = '598098037399';
  const STORAGE_KEY = 'rgol_cart';
  const TRANSFER_DISCOUNT = 0.05; // -5% al pagar por transferencia
  let selectedMethod = 'mp';

  function loadCart() {
    try {
      return JSON.parse(localStorage.getItem(STORAGE_KEY)) || [];
    } catch (e) {
      return [];
    }
  }

  function saveCart(cart) {
    localStorage.setItem(STORAGE_KEY, JSON.stringify(cart));
    updateBadge();
  }

  function formatPrice(n) {
    return '$' + Math.round(n).toString().replace(/\B(?=(\d{3})+(?!\d))/g, '.');
  }

  function cartCount() {
    return loadCart().reduce((sum, item) => sum + item.qty, 0);
  }

  function cartTotal() {
    return loadCart().reduce((sum, item) => sum + item.qty * item.precio, 0);
  }

  function displayTotal() {
    const total = cartTotal();
    return selectedMethod === 'transfer' ? total * (1 - TRANSFER_DISCOUNT) : total;
  }

  function updateBadge() {
    const badge = document.getElementById('rgol-cart-badge');
    if (!badge) return;
    const count = cartCount();
    badge.textContent = count;
    badge.style.display = count > 0 ? 'flex' : 'none';
  }

  // Llamada desde los botones "Agregar al carrito" de cada producto
  window.addToCart = function (producto, btn) {
    const card = btn.closest('.product-card');
    const selected = card.querySelector('.size-btn.selected');
    if (!selected || selected.classList.contains('agotado')) return;
    const talle = selected.textContent.trim();
    const priceEl = card.querySelector('.price-current');
    const precio = parseInt(priceEl.textContent.replace(/[^\d]/g, ''), 10) || 0;
    const imgEl = card.querySelector('.carousel-track img');
    const img = imgEl ? imgEl.getAttribute('src') : '';

    const cart = loadCart();
    const id = producto + '|' + talle;
    const existing = cart.find(i => i.id === id);
    if (existing) {
      existing.qty += 1;
    } else {
      cart.push({ id, producto, talle, precio, qty: 1, img });
    }
    saveCart(cart);
    showToast(`Agregado: ${producto} (${talle})`);

    if (typeof gtag === 'function') {
      gtag('event', 'add_to_cart', { event_category: 'Carrito', event_label: producto, value: precio });
    }
  };

  function removeItem(id) {
    saveCart(loadCart().filter(i => i.id !== id));
    renderCart();
  }

  function changeQty(id, delta) {
    const cart = loadCart();
    const item = cart.find(i => i.id === id);
    if (!item) return;
    item.qty += delta;
    if (item.qty <= 0) {
      saveCart(cart.filter(i => i.id !== id));
    } else {
      saveCart(cart);
    }
    renderCart();
  }

  function clearCart() {
    saveCart([]);
    renderCart();
  }

  function showToast(msg) {
    let toast = document.getElementById('rgol-toast');
    if (!toast) {
      toast = document.createElement('div');
      toast.id = 'rgol-toast';
      document.body.appendChild(toast);
    }
    toast.textContent = msg;
    toast.classList.add('show');
    clearTimeout(toast._timer);
    toast._timer = setTimeout(() => toast.classList.remove('show'), 2200);
  }

  function renderCart() {
    const cart = loadCart();
    const itemsEl = document.getElementById('rgol-cart-items');
    const totalEl = document.getElementById('rgol-cart-total');
    const emptyEl = document.getElementById('rgol-cart-empty');
    const checkoutBtn = document.getElementById('rgol-cart-checkout');
    const payBtn = document.getElementById('rgol-cart-pay');
    if (!itemsEl) return;

    itemsEl.innerHTML = '';

    if (cart.length === 0) {
      emptyEl.style.display = 'block';
      checkoutBtn.disabled = true;
      payBtn.disabled = true;
    } else {
      emptyEl.style.display = 'none';
      checkoutBtn.disabled = false;
      payBtn.disabled = false;
      cart.forEach(item => {
        const row = document.createElement('div');
        row.className = 'rgol-cart-row';
        row.innerHTML = `
          <img class="rgol-cart-row-img" src="${item.img || ''}" alt="${item.producto}">
          <div class="rgol-cart-row-info">
            <div class="rgol-cart-row-name">${item.producto}</div>
            <div class="rgol-cart-row-talle">Talle ${item.talle} · ${formatPrice(item.precio)} c/u</div>
          </div>
          <div class="rgol-cart-row-qty">
            <button data-action="dec" aria-label="Restar">−</button>
            <span>${item.qty}</span>
            <button data-action="inc" aria-label="Sumar">+</button>
          </div>
          <button class="rgol-cart-row-remove" data-action="remove" aria-label="Quitar">✕</button>
        `;
        row.querySelector('[data-action="dec"]').onclick = () => changeQty(item.id, -1);
        row.querySelector('[data-action="inc"]').onclick = () => changeQty(item.id, 1);
        row.querySelector('[data-action="remove"]').onclick = () => removeItem(item.id);
        itemsEl.appendChild(row);
      });
    }
    totalEl.textContent = formatPrice(displayTotal());
  }

  function openCart() {
    document.getElementById('rgol-cart-drawer').classList.add('open');
    document.getElementById('rgol-cart-overlay').classList.add('open');
    document.getElementById('rgol-cart-minibar').classList.remove('show');
    renderCart();
  }

  function closeCart() {
    document.getElementById('rgol-cart-drawer').classList.remove('open');
    document.getElementById('rgol-cart-overlay').classList.remove('open');
    document.getElementById('rgol-cart-minibar').classList.remove('show');
  }

  function minimizeCart() {
    const cart = loadCart();
    if (cart.length === 0) { closeCart(); return; }
    document.getElementById('rgol-cart-drawer').classList.remove('open');
    document.getElementById('rgol-cart-overlay').classList.remove('open');
    document.getElementById('rgol-cart-minibar-text').textContent =
      `${cartCount()} ${cartCount() === 1 ? 'producto' : 'productos'} · ${formatPrice(cartTotal())}`;
    document.getElementById('rgol-cart-minibar').classList.add('show');
  }

  function checkoutWhatsApp() {
    const cart = loadCart();
    if (cart.length === 0) return;
    const discountMultiplier = 1 - TRANSFER_DISCOUNT;
    let msg = 'Hola! Quiero pagar este pedido por transferencia (-5%):\n\n';
    cart.forEach(item => {
      const subtotal = item.precio * item.qty * discountMultiplier;
      msg += `• ${item.producto} - Talle: ${item.talle} - Cant: ${item.qty} - ${formatPrice(subtotal)}\n`;
    });
    msg += `\n*Total con descuento: ${formatPrice(displayTotal())}*\n\nYa hice (o voy a hacer) la transferencia a la cuenta de Mercado Pago, te paso el comprobante.`;

    if (typeof gtag === 'function') {
      gtag('event', 'generate_lead', { event_category: 'Transferencia', event_label: 'Checkout carrito', value: displayTotal() });
    }

    window.open('https://wa.me/' + WHATSAPP_NUMBER + '?text=' + encodeURIComponent(msg), '_blank');
  }

  async function payWithMercadoPago() {
    const cart = loadCart();
    if (cart.length === 0) return;

    const payBtn = document.getElementById('rgol-cart-pay');
    const originalText = payBtn.textContent;
    payBtn.disabled = true;
    payBtn.textContent = 'Generando pago...';

    if (typeof gtag === 'function') {
      gtag('event', 'begin_checkout', { event_category: 'Mercado Pago', value: cartTotal() });
    }

    try {
      const resp = await fetch('/api/create-preference', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ cart }),
      });
      const data = await resp.json();

      if (!resp.ok || !data.init_point) {
        throw new Error((data && data.error) || 'No se pudo generar el pago');
      }

      window.location.href = data.init_point;
    } catch (err) {
      showToast('No se pudo iniciar el pago. Probá de nuevo o usá WhatsApp.');
      payBtn.disabled = false;
      payBtn.textContent = originalText;
    }
  }

  function injectUI() {
    const wrap = document.createElement('div');
    wrap.innerHTML = `
      <button id="rgol-cart-fab" aria-label="Ver carrito">
        🛒<span id="rgol-cart-badge">0</span>
      </button>
      <div id="rgol-cart-overlay"></div>
      <div id="rgol-cart-drawer">
        <div class="rgol-cart-header">
          <span>Tu carrito</span>
          <div class="rgol-cart-header-actions">
            <button id="rgol-cart-minimize" aria-label="Minimizar">─</button>
            <button id="rgol-cart-close" aria-label="Cerrar">✕</button>
          </div>
        </div>
        <div id="rgol-cart-items"></div>
        <p id="rgol-cart-empty">Todavía no agregaste camisetas.</p>
        <div class="rgol-cart-footer">
          <div class="rgol-cart-total-row">
            <span>Total</span>
            <span id="rgol-cart-total">$0</span>
          </div>
          <div class="rgol-cart-method-label">Método de pago</div>
          <div class="rgol-cart-method-toggle">
            <button id="rgol-method-mp" class="rgol-method-btn active" data-method="mp">Mercado Pago</button>
            <button id="rgol-method-transfer" class="rgol-method-btn" data-method="transfer">Transferencia <span class="rgol-discount-tag">-5%</span></button>
          </div>
          <div id="rgol-transfer-info">
            <div class="rgol-transfer-row"><span>Cuenta Mercado Pago</span><strong>1008657986565</strong></div>
            <div class="rgol-transfer-row"><span>Titular</span><strong>Sebastian Tejera</strong></div>
            <p class="rgol-transfer-note">Hacé la transferencia por ese monto y avisanos por WhatsApp con el comprobante para confirmar tu pedido.</p>
          </div>
          <button id="rgol-cart-pay">Pagar con Mercado Pago</button>
          <button id="rgol-cart-checkout" style="display:none;">Ya transferí, avisar por WhatsApp</button>
          <button id="rgol-cart-clear">Vaciar carrito</button>
        </div>
      </div>
      <div id="rgol-toast"></div>
      <div id="rgol-cart-minibar">
        <span id="rgol-cart-minibar-text"></span>
        <span id="rgol-cart-minibar-expand">Ver carrito ▲</span>
      </div>
    `;
    document.body.appendChild(wrap);

    document.getElementById('rgol-cart-fab').onclick = openCart;
    document.getElementById('rgol-cart-close').onclick = closeCart;
    document.getElementById('rgol-cart-overlay').onclick = closeCart;
    document.getElementById('rgol-cart-pay').onclick = payWithMercadoPago;
    document.getElementById('rgol-cart-checkout').onclick = checkoutWhatsApp;
    document.getElementById('rgol-cart-clear').onclick = clearCart;
    document.getElementById('rgol-cart-minimize').onclick = minimizeCart;
    document.getElementById('rgol-cart-minibar').onclick = openCart;
    document.getElementById('rgol-method-mp').onclick = () => selectMethod('mp');
    document.getElementById('rgol-method-transfer').onclick = () => selectMethod('transfer');
    selectMethod('mp');

    updateBadge();
  }

  function selectMethod(method) {
    selectedMethod = method;
    document.getElementById('rgol-method-mp').classList.toggle('active', method === 'mp');
    document.getElementById('rgol-method-transfer').classList.toggle('active', method === 'transfer');
    document.getElementById('rgol-transfer-info').classList.toggle('show', method === 'transfer');
    document.getElementById('rgol-cart-pay').style.display = method === 'mp' ? 'block' : 'none';
    document.getElementById('rgol-cart-checkout').style.display = method === 'transfer' ? 'block' : 'none';

    const totalEl = document.getElementById('rgol-cart-total');
    if (totalEl) totalEl.textContent = formatPrice(displayTotal());
  }


  document.addEventListener('DOMContentLoaded', injectUI);
})();
