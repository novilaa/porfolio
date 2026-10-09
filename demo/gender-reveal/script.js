// Общий скрипт демо-приглашений. Настройки страницы — в window.INVITE:
// { date: '2027-06-12T15:30:00+03:00', endText: '...', scriptURL: '' }
(function () {
  var cfg = window.INVITE || {};
  var $ = function (s, r) { return (r || document).querySelector(s); };
  var $$ = function (s, r) { return Array.prototype.slice.call((r || document).querySelectorAll(s)); };

  // ===== КАЛЕНДАРЬ (строится по дате) =====
  var grid = $('#calendarGrid');
  if (grid && cfg.date) {
    var d = new Date(cfg.date);
    var y = d.getFullYear(), m = d.getMonth(), day = d.getDate();
    var first = (new Date(y, m, 1).getDay() + 6) % 7;
    var total = new Date(y, m + 1, 0).getDate();
    var html = '';
    for (var i = 0; i < first; i++) html += '<div class="cal-day empty"></div>';
    for (var n = 1; n <= total; n++) html += '<div class="cal-day' + (n === day ? ' mark' : '') + '">' + n + '</div>';
    grid.innerHTML = html;
  }

  // ===== ОБРАТНЫЙ ОТСЧЁТ =====
  function tick() {
    if (!cfg.date || !$('#days')) return;
    var diff = new Date(cfg.date).getTime() - Date.now();
    if (diff > 0) {
      var p = function (v) { return String(v).padStart(2, '0'); };
      $('#days').textContent = p(Math.floor(diff / 86400000));
      $('#hours').textContent = p(Math.floor(diff % 86400000 / 3600000));
      $('#minutes').textContent = p(Math.floor(diff % 3600000 / 60000));
      $('#seconds').textContent = p(Math.floor(diff % 60000 / 1000));
    } else {
      var box = $('.countdown-numbers');
      if (box) box.innerHTML = '<div class="countdown-end">' + (cfg.endText || 'Этот день настал!') + '</div>';
    }
  }
  tick();
  setInterval(tick, 1000);

  // ===== АНКЕТА =====
  var form = $('#rsvpForm');
  if (form) {
    var show = function (id) {
      ['loadingStatus', 'successStatus', 'errorStatus'].forEach(function (k) {
        var el = document.getElementById(k);
        if (el) el.style.display = k === id ? 'block' : 'none';
      });
    };
    form.addEventListener('submit', async function (e) {
      e.preventDefault();
      $$('.form-group.error').forEach(function (el) { el.classList.remove('error'); });
      var ok = true;
      var nameEl = $('#guestsNames');
      var name = nameEl.value.trim();
      if (!/^[\sа-яА-ЯёЁa-zA-Z,\-']{3,100}$/.test(name)) { nameEl.closest('.form-group').classList.add('error'); ok = false; }
      var att = form.attendance.value;
      if (!att) { $('input[name="attendance"]').closest('.form-group').classList.add('error'); ok = false; }
      if (!ok) { var bad = $('.form-group.error'); if (bad) bad.scrollIntoView({ behavior: 'smooth', block: 'center' }); return; }
      show('loadingStatus');
      var extra = $$('input[name="extra"]:checked').map(function (c) { return c.value; }).join(', ') || 'Не указано';
      try {
        if (cfg.scriptURL) {
          await fetch(cfg.scriptURL, { method: 'POST', mode: 'no-cors', headers: { 'Content-Type': 'text/plain' }, body: JSON.stringify({ guestsNames: name, attendance: att, guess: (form.guess && form.guess.value) || "", extra: extra }) });
        }
        show('successStatus');
        form.reset();
        setTimeout(function () { show(''); }, 5000);
      } catch (err) {
        show('errorStatus');
        setTimeout(function () { show(''); }, 6000);
      }
    });
  }

  // ===== ПОЯВЛЕНИЕ ПРИ СКРОЛЛЕ =====
  var items = $$('.reveal');
  if ('IntersectionObserver' in window) {
    var io = new IntersectionObserver(function (entries) {
      entries.forEach(function (en, i) {
        if (en.isIntersecting) {
          setTimeout(function () { en.target.classList.add('visible'); }, (i % 4) * 90);
          io.unobserve(en.target);
        }
      });
    }, { threshold: 0.08 });
    items.forEach(function (el) { io.observe(el); });
  } else {
    items.forEach(function (el) { el.classList.add('visible'); });
  }
})();
