<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
                xmlns:html="http://www.w3.org/TR/REC-html40"
                xmlns:sitemap="http://www.sitemaps.org/schemas/sitemap/0.9"
                xmlns:xhtml="http://www.w3.org/1999/xhtml"
                xmlns:image="http://www.google.com/schemas/sitemap-image/1.1"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"/>

  <xsl:template match="/">
    <html xmlns="http://www.w3.org/1999/xhtml" lang="es">
      <head>
        <title>Mapa del Sitio XML · Mireia Felici Psicología Valencia</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta name="robots" content="noindex, follow" />
        <style type="text/css">
          *, *::before, *::after {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
          }

          body {
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
            background-color: #faf9f6;
            color: #1e1e1e;
            line-height: 1.5;
            -webkit-font-smoothing: antialiased;
            padding-bottom: 60px;
          }

          a {
            color: #886629;
            text-decoration: none;
            transition: color 0.2s ease;
          }

          a:hover {
            color: #6c511f;
            text-decoration: underline;
          }

          .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 24px;
          }

          /* Header Superior */
          .site-header {
            background-color: #ffffff;
            border-bottom: 1px solid #e7e2d9;
            padding: 18px 0;
            position: sticky;
            top: 0;
            z-index: 100;
            box-shadow: 0 1px 3px rgba(0,0,0,0.02);
          }

          .header-inner {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 16px;
          }

          .brand-title {
            font-family: "Newsreader", Georgia, serif;
            font-size: 20px;
            font-weight: 500;
            color: #1e1e1e;
            letter-spacing: -0.01em;
          }

          .brand-subtitle {
            display: block;
            font-size: 11px;
            color: #767676;
            text-transform: uppercase;
            letter-spacing: 0.08em;
            margin-top: 2px;
          }

          .btn-back {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            background-color: #faf9f6;
            color: #595959;
            font-size: 13px;
            font-weight: 500;
            padding: 8px 16px;
            border-radius: 9999px;
            border: 1px solid #e7e2d9;
            transition: all 0.2s ease;
          }

          .btn-back:hover {
            background-color: #1e1e1e;
            color: #ffffff;
            border-color: #1e1e1e;
            text-decoration: none;
          }

          /* Hero Intro */
          .hero-section {
            padding: 40px 0 28px;
          }

          .badge-pill {
            display: inline-block;
            font-size: 11px;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.12em;
            color: #886629;
            background-color: #f3efe6;
            padding: 4px 12px;
            border-radius: 9999px;
            margin-bottom: 14px;
          }

          .hero-title {
            font-family: "Newsreader", Georgia, serif;
            font-size: 32px;
            font-weight: 400;
            color: #1e1e1e;
            line-height: 1.25;
            margin-bottom: 12px;
          }

          .hero-desc {
            font-size: 14px;
            color: #595959;
            max-width: 820px;
            line-height: 1.6;
          }

          /* Grid de Métricas */
          .metrics-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
            gap: 16px;
            margin: 28px 0;
          }

          .metric-card {
            background-color: #ffffff;
            border: 1px solid #e7e2d9;
            border-radius: 14px;
            padding: 20px 22px;
            box-shadow: 0 1px 3px rgba(0,0,0,0.02);
            transition: transform 0.2s ease, box-shadow 0.2s ease;
          }

          .metric-card:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 16px rgba(0,0,0,0.04);
          }

          .metric-num {
            font-family: "Newsreader", Georgia, serif;
            font-size: 32px;
            font-weight: 500;
            color: #886629;
            line-height: 1;
            margin-bottom: 6px;
          }

          .metric-label {
            font-size: 12px;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.06em;
            color: #1e1e1e;
          }

          .metric-sub {
            font-size: 12px;
            color: #767676;
            margin-top: 4px;
          }

          /* Barra de Controles (Búsqueda + Filtros) */
          .controls-bar {
            background-color: #ffffff;
            border: 1px solid #e7e2d9;
            border-radius: 14px;
            padding: 16px 20px;
            margin-bottom: 24px;
            display: flex;
            flex-wrap: wrap;
            align-items: center;
            justify-content: space-between;
            gap: 16px;
            box-shadow: 0 1px 3px rgba(0,0,0,0.02);
          }

          .filter-tabs {
            display: flex;
            flex-wrap: wrap;
            gap: 8px;
          }

          .filter-tab {
            background-color: #faf9f6;
            color: #595959;
            border: 1px solid #e7e2d9;
            padding: 6px 14px;
            border-radius: 9999px;
            font-size: 12px;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.2s ease;
          }

          .filter-tab:hover {
            background-color: #f2efe9;
            color: #1e1e1e;
          }

          .filter-tab.active {
            background-color: #1e1e1e;
            color: #ffffff;
            border-color: #1e1e1e;
          }

          .search-box {
            position: relative;
            min-width: 260px;
            flex: 1;
            max-width: 360px;
          }

          .search-input {
            width: 100%;
            padding: 8px 14px 8px 34px;
            font-size: 13px;
            border: 1px solid #e7e2d9;
            border-radius: 9999px;
            background-color: #faf9f6;
            color: #1e1e1e;
            outline: none;
            transition: all 0.2s ease;
          }

          .search-input:focus {
            background-color: #ffffff;
            border-color: #886629;
            box-shadow: 0 0 0 3px rgba(136, 102, 41, 0.12);
          }

          .search-icon {
            position: absolute;
            left: 12px;
            top: 50%;
            transform: translateY(-50%);
            width: 14px;
            height: 14px;
            color: #767676;
            pointer-events: none;
          }

          .counter-text {
            font-size: 12px;
            color: #767676;
            font-weight: 500;
            width: 100%;
            padding-top: 4px;
            border-top: 1px solid #f2efe9;
          }

          /* Tabla de URLs */
          .table-wrapper {
            background-color: #ffffff;
            border: 1px solid #e7e2d9;
            border-radius: 14px;
            overflow: hidden;
            box-shadow: 0 1px 4px rgba(0,0,0,0.02);
          }

          .sitemap-table {
            width: 100%;
            border-collapse: collapse;
            text-align: left;
            font-size: 13px;
          }

          .sitemap-table thead th {
            background-color: #f7f5f0;
            color: #595959;
            font-size: 11px;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.08em;
            padding: 14px 18px;
            border-bottom: 1px solid #e7e2d9;
            white-space: nowrap;
          }

          .sitemap-table tbody tr {
            border-bottom: 1px solid #f0ece3;
            transition: background-color 0.15s ease;
          }

          .sitemap-table tbody tr:last-child {
            border-bottom: none;
          }

          .sitemap-table tbody tr:hover {
            background-color: #fdfcf9;
          }

          .sitemap-table tbody td {
            padding: 14px 18px;
            vertical-align: middle;
          }

          .td-index {
            color: #767676;
            font-size: 12px;
            font-weight: 500;
            width: 44px;
          }

          .url-main {
            font-weight: 500;
            word-break: break-all;
            display: inline-block;
          }

          .url-path-highlight {
            color: #1e1e1e;
            font-weight: 600;
          }

          .tag-lang {
            display: inline-block;
            font-size: 11px;
            font-weight: 600;
            padding: 3px 8px;
            border-radius: 6px;
            text-align: center;
          }

          .tag-es {
            background-color: #f2efe9;
            color: #595959;
            border: 1px solid #e5dfd5;
          }

          .tag-va {
            background-color: #fbf3e4;
            color: #886629;
            border: 1px solid #eddcc0;
          }

          .tag-priority {
            display: inline-flex;
            align-items: center;
            gap: 6px;
            font-size: 12px;
            font-weight: 600;
            padding: 3px 10px;
            border-radius: 9999px;
          }

          .priority-high {
            background-color: #f4eee1;
            color: #886629;
          }

          .priority-med {
            background-color: #f2efe9;
            color: #595959;
          }

          .tag-freq {
            color: #767676;
            font-size: 12px;
            text-transform: capitalize;
          }

          .tag-date {
            color: #595959;
            font-size: 12px;
            font-variant-numeric: tabular-nums;
            white-space: nowrap;
          }

          .tag-images {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            min-width: 24px;
            height: 22px;
            padding: 0 6px;
            border-radius: 9999px;
            font-size: 11px;
            font-weight: 600;
            background-color: #faf9f6;
            color: #595959;
            border: 1px solid #e7e2d9;
          }

          .tag-images.has-images {
            background-color: #f3efe6;
            color: #886629;
            border-color: #eddcc0;
          }

          /* Footer Informativo */
          .site-footer {
            margin-top: 48px;
            padding-top: 28px;
            border-top: 1px solid #e7e2d9;
            text-align: center;
            font-size: 12px;
            color: #767676;
            line-height: 1.6;
          }

          .footer-address {
            color: #595959;
            font-weight: 500;
            margin-bottom: 6px;
          }

          @media (max-width: 768px) {
            .table-wrapper {
              overflow-x: auto;
            }
            .hero-title {
              font-size: 26px;
            }
            .search-box {
              max-width: 100%;
            }
          }
        </style>
      </head>
      <body>
        <!-- Header Superior -->
        <header class="site-header">
          <div class="container header-inner">
            <div>
              <a href="https://mireiafelici.es/" class="brand-title">Mireia Felici</a>
              <span class="brand-subtitle">Psicóloga General Sanitaria · Col. N.º CV17270</span>
            </div>
            <a href="https://mireiafelici.es/" class="btn-back">
              <span>← Volver a la web</span>
            </a>
          </div>
        </header>

        <main class="container">
          <!-- Hero Intro -->
          <section class="hero-section">
            <span class="badge-pill">Índice Oficial de Indexación · XML Sitemap</span>
            <h1 class="hero-title">Mapa del Sitio Web</h1>
            <p class="hero-desc">
              Este archivo XML estructura y comunica a los motores de búsqueda (Google, Bing) todas las URLs indexables, sus alternativas lingüísticas (castellano y valenciano) y sus imágenes asociadas. Gracias a esta hoja de estilos XSLT, la información también se muestra de forma visual y accesible para personas.
            </p>
          </section>

          <!-- Métricas Resumen -->
          <section class="metrics-grid">
            <div class="metric-card">
              <div class="metric-num"><xsl:value-of select="count(sitemap:urlset/sitemap:url)"/></div>
              <div class="metric-label">URLs Indexadas</div>
              <div class="metric-sub">Páginas activas rastreables</div>
            </div>
            <div class="metric-card">
              <div class="metric-num"><xsl:value-of select="count(sitemap:urlset/sitemap:url[not(contains(sitemap:loc, '/va/'))])"/></div>
              <div class="metric-label">Castellano (ES)</div>
              <div class="metric-sub">Páginas en lengua castellana</div>
            </div>
            <div class="metric-card">
              <div class="metric-num"><xsl:value-of select="count(sitemap:urlset/sitemap:url[contains(sitemap:loc, '/va/')])"/></div>
              <div class="metric-label">Valencià (VA)</div>
              <div class="metric-sub">Pàgines en llengua valenciana</div>
            </div>
            <div class="metric-card">
              <div class="metric-num"><xsl:value-of select="count(sitemap:urlset/sitemap:url/image:image)"/></div>
              <div class="metric-label">Imágenes Asociadas</div>
              <div class="metric-sub">Recursos gráficos indexados</div>
            </div>
          </section>

          <!-- Barra de Controles: Filtros y Búsqueda -->
          <section class="controls-bar">
            <div class="filter-tabs">
              <button type="button" class="filter-tab active" data-filter="all">Todas (<xsl:value-of select="count(sitemap:urlset/sitemap:url)"/>)</button>
              <button type="button" class="filter-tab" data-filter="es">Castellano (<xsl:value-of select="count(sitemap:urlset/sitemap:url[not(contains(sitemap:loc, '/va/'))])"/>)</button>
              <button type="button" class="filter-tab" data-filter="va">Valencià (<xsl:value-of select="count(sitemap:urlset/sitemap:url[contains(sitemap:loc, '/va/')])"/>)</button>
              <button type="button" class="filter-tab" data-filter="landing">Especialidades / Landings (22)</button>
              <button type="button" class="filter-tab" data-filter="main">Páginas Principales (12)</button>
            </div>

            <div class="search-box">
              <svg class="search-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                <circle cx="11" cy="11" r="8"></circle>
                <line x1="21" y1="21" x2="16.65" y2="16.65"></line>
              </svg>
              <input type="text" id="sitemap-search" class="search-input" placeholder="Filtrar por URL o término..." />
            </div>

            <div class="counter-text">
              Mostrando <strong id="visible-count"><xsl:value-of select="count(sitemap:urlset/sitemap:url)"/></strong> de <xsl:value-of select="count(sitemap:urlset/sitemap:url)"/> URLs
            </div>
          </section>

          <!-- Tabla de URLs -->
          <div class="table-wrapper">
            <table class="sitemap-table">
              <thead>
                <tr>
                  <th class="td-index">#</th>
                  <th>URL de la Página</th>
                  <th>Idioma</th>
                  <th>Prioridad</th>
                  <th>Frecuencia</th>
                  <th>Última Actualización</th>
                  <th style="text-align: center;">Imágenes</th>
                </tr>
              </thead>
              <tbody id="sitemap-tbody">
                <xsl:for-each select="sitemap:urlset/sitemap:url">
                  <xsl:variable name="loc" select="sitemap:loc" />
                  <xsl:variable name="isVa" select="contains($loc, '/va/')" />
                  <xsl:variable name="isLanding" select="contains($loc, 'terapia-') or contains($loc, 'psicolog') or contains($loc, 'ataques-')" />
                  <tr>
                    <xsl:attribute name="data-lang">
                      <xsl:choose>
                        <xsl:when test="$isVa">va</xsl:when>
                        <xsl:otherwise>es</xsl:otherwise>
                      </xsl:choose>
                    </xsl:attribute>
                    <xsl:attribute name="data-type">
                      <xsl:choose>
                        <xsl:when test="$isLanding">landing</xsl:when>
                        <xsl:otherwise>main</xsl:otherwise>
                      </xsl:choose>
                    </xsl:attribute>

                    <td class="td-index"><xsl:value-of select="position()"/></td>
                    <td>
                      <a href="{$loc}" target="_blank" rel="noopener noreferrer" class="url-main">
                        <xsl:value-of select="$loc"/>
                      </a>
                    </td>
                    <td>
                      <xsl:choose>
                        <xsl:when test="$isVa">
                          <span class="tag-lang tag-va">Valencià</span>
                        </xsl:when>
                        <xsl:otherwise>
                          <span class="tag-lang tag-es">Castellano</span>
                        </xsl:otherwise>
                      </xsl:choose>
                    </td>
                    <td>
                      <xsl:choose>
                        <xsl:when test="sitemap:priority = '1.0'">
                          <span class="tag-priority priority-high">1.0 · Principal</span>
                        </xsl:when>
                        <xsl:when test="sitemap:priority = '0.9'">
                          <span class="tag-priority priority-high">0.9 · Alta</span>
                        </xsl:when>
                        <xsl:otherwise>
                          <span class="tag-priority priority-med"><xsl:value-of select="sitemap:priority"/> · Media</span>
                        </xsl:otherwise>
                      </xsl:choose>
                    </td>
                    <td>
                      <span class="tag-freq">
                        <xsl:choose>
                          <xsl:when test="sitemap:changefreq = 'weekly'">Semanal</xsl:when>
                          <xsl:when test="sitemap:changefreq = 'monthly'">Mensual</xsl:when>
                          <xsl:otherwise><xsl:value-of select="sitemap:changefreq"/></xsl:otherwise>
                        </xsl:choose>
                      </span>
                    </td>
                    <td>
                      <span class="tag-date"><xsl:value-of select="sitemap:lastmod"/></span>
                    </td>
                    <td style="text-align: center;">
                      <xsl:variable name="imgCount" select="count(image:image)" />
                      <xsl:choose>
                        <xsl:when test="$imgCount > 0">
                          <span class="tag-images has-images"><xsl:value-of select="$imgCount"/></span>
                        </xsl:when>
                        <xsl:otherwise>
                          <span class="tag-images">0</span>
                        </xsl:otherwise>
                      </xsl:choose>
                    </td>
                  </tr>
                </xsl:for-each>
              </tbody>
            </table>
          </div>

          <!-- Footer Informativo -->
          <footer class="site-footer">
            <p class="footer-address">Mireia Felici Peris · Psicóloga General Sanitaria (Col. N.º CV17270)</p>
            <p>Consulta Presencial en Calle San Vicente Mártir, 85 · 46007 Valencia | Atención Online</p>
            <p style="margin-top: 8px; color: #a09a8e;">
              Documento estructurado conforme a la especificación oficial sitemaps.org 0.9 y Google Image Extensions.
            </p>
          </footer>
        </main>

        <!-- Script de Filtrado y Búsqueda Dinámica -->
        <script type="text/javascript">
          <![CDATA[
          document.addEventListener('DOMContentLoaded', function() {
            var searchInput = document.getElementById('sitemap-search');
            var filterTabs = document.querySelectorAll('.filter-tab');
            var rows = document.querySelectorAll('#sitemap-tbody tr');
            var visibleCountSpan = document.getElementById('visible-count');
            var currentFilter = 'all';

            function updateRows() {
              var query = (searchInput.value || '').trim().toLowerCase();
              var visibleCount = 0;

              for (var i = 0; i < rows.length; i++) {
                var row = rows[i];
                var rowLang = row.getAttribute('data-lang');
                var rowType = row.getAttribute('data-type');
                var text = row.textContent.toLowerCase();

                var matchesFilter = true;
                if (currentFilter === 'es' && rowLang !== 'es') matchesFilter = false;
                if (currentFilter === 'va' && rowLang !== 'va') matchesFilter = false;
                if (currentFilter === 'landing' && rowType !== 'landing') matchesFilter = false;
                if (currentFilter === 'main' && rowType !== 'main') matchesFilter = false;

                var matchesSearch = query === '' || text.indexOf(query) !== -1;

                if (matchesFilter && matchesSearch) {
                  row.style.display = '';
                  visibleCount++;
                } else {
                  row.style.display = 'none';
                }
              }

              if (visibleCountSpan) {
                visibleCountSpan.textContent = visibleCount;
              }
            }

            for (var j = 0; j < filterTabs.length; j++) {
              filterTabs[j].addEventListener('click', function() {
                for (var k = 0; k < filterTabs.length; k++) {
                  filterTabs[k].classList.remove('active');
                }
                this.classList.add('active');
                currentFilter = this.getAttribute('data-filter');
                updateRows();
              });
            }

            if (searchInput) {
              searchInput.addEventListener('input', updateRows);
            }
          });
          ]]>
        </script>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
