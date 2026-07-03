---
layout: page
title: Tjänster och verktyg
permalink: /verktyg.html
redirect_from:
  - /verktyg/
---
<h1>{{ page.title }}</h1>
<p>
  Aktiva verktyg och initiativ för öppna data, offentlighetsprincipen och granskning.
  Historiska projekt finns i <a href="{{ '/arkiv.html' | relative_url }}">arkivet</a>.
</p>

<div class="filter-bar">
  <button class="filter-btn is-active" data-filter="all" type="button">Alla</button>
  <button class="filter-btn" data-filter="sweden" type="button">Sverige</button>
  <button class="filter-btn" data-filter="nordics" type="button">Norden</button>
  <button class="filter-btn" data-filter="eu" type="button">EU</button>
</div>

<section class="section" id="utvalda-verktyg">
  <h2>Utvalda verktyg</h2>
  {% assign featured = site.tools | where: "featured", true | sort: "featured_order" %}
  <div class="card-grid">
    {% for tool in featured %}
    {% include card.html title=tool.title url=tool.link description=tool.content region=tool.region status=tool.status category=tool.category %}
    {% endfor %}
  </div>
</section>

{% assign categories = "Begär information,Få översikt,Granska,Interagera,Beskriva och förvalta,Hitta data" | split: "," %}
{% for cat in categories %}
{% assign tools_in_cat = site.tools | where: "category", cat | where: "status", "active" %}
{% if tools_in_cat.size > 0 %}
<section class="section" id="{{ cat | slugify }}">
  <h2>{{ cat }}</h2>
  <div class="card-grid">
    {% for tool in tools_in_cat %}
    {% include card.html title=tool.title url=tool.link description=tool.content region=tool.region status=tool.status category=tool.category %}
    {% endfor %}
  </div>
</section>
{% endif %}
{% endfor %}

<p><a href="{{ '/arkiv.html' | relative_url }}">Se arkiverade verktyg &rarr;</a></p>