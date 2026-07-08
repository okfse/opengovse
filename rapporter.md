---
layout: page
title: Rapporter och presentationer
permalink: /rapporter.html
redirect_from:
  - /rapporter/
---
<h1>{{ page.title }}</h1>
<p>
  Länkar till rapporter och forskning om öppna data och öppen förvaltning.
  Känner du till en rapport som saknas?
  <a href="https://github.com/okfse/opengovse/issues">Lägg ett ärende på GitHub</a>.
</p>

<div class="filter-bar">
  <button class="filter-btn is-active" data-filter="all" type="button">Alla</button>
  <button class="filter-btn" data-filter="sweden" type="button">Sverige</button>
  <button class="filter-btn" data-filter="nordics" type="button">Norden</button>
  <button class="filter-btn" data-filter="eu" type="button">EU</button>
  <button class="filter-btn" data-filter="historical" type="button">Historiska</button>
</div>

{% for category in site.data.reports.categories %}
<section class="section" id="{{ category.id }}">
  <h2>{{ category.title }}</h2>
  <div class="card-grid">
    {% for report in category.items %}
    <article class="card" data-region="{{ report.region }}" data-status="{{ report.status }}">
      <h3><a href="{{ report.url }}" rel="noopener">{{ report.title }}</a></h3>
      {% if report.fallback_url %}
      <p class="card-fallback">
        <a href="{{ report.fallback_url }}" rel="noopener">Alternativ källa</a>
        {% unless report.primary_ok %}<span class="card-note">(primär länk trasig)</span>{% endunless %}
      </p>
      {% endif %}
      {% if report.mirror %}
      <p class="card-mirror">
        <a href="{{ report.mirror | relative_url }}">
          {% if report.mirror_format == 'pdf' %}Lokal kopia (PDF){% else %}Lokal kopia (arkiverad sida){% endif %}
        </a>
      </p>
      {% endif %}
      <div class="card-meta">
        <span class="tag tag-{{ report.region }}">{{ report.region }}</span>
        {% if report.year %}<span class="tag">{{ report.year }}</span>{% endif %}
        {% if report.status == 'historical' %}<span class="tag tag-archived">Historisk</span>{% endif %}
      </div>
    </article>
    {% endfor %}
  </div>
</section>
{% endfor %}

<p>Se även <a href="https://www.opendataresearch.org/emergingimpacts" lang="en">Open Data Research Network</a>.</p>