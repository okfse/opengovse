---
layout: page
title: Norden & EU
permalink: /norden-eu.html
---
<h1>Norden och Europa</h1>
<p>
  Öppna data och transparens är gränsöverskridande frågor. Nordiska länder delar många demokratiska traditioner,
  medan EU sätter gemensamma ramar för dataportaler och återanvändning.
</p>

<section class="section">
  <h2>Nordiska dataportaler</h2>
  <div class="card-grid">
    {% for portal in site.data.portals.nordics %}
    {% include card.html title=portal.name url=portal.url description=portal.description region="nordics" status="active" %}
    {% endfor %}
  </div>
</section>

<section class="section">
  <h2>EU och europeiskt samarbete</h2>
  <div class="card-grid">
    {% for portal in site.data.portals.europe %}
    {% include card.html title=portal.name url=portal.url description=portal.description region="eu" status="active" %}
    {% endfor %}
  </div>
</section>

<section class="section">
  <h2>Regelverk och standarder (kort översikt)</h2>
  <ul>
    <li><strong>EU:s öppna data-direktiv</strong> — medlemsstater ska tillgängliggöra offentliga data för återanvändning.</li>
    <li><strong>DCAT-AP</strong> — gemensam metadatastandard för dataportaler i Europa.</li>
    <li><strong>Data Governance Act</strong> — regler för datadelning och datamäklare inom EU.</li>
    <li><strong>Data Act</strong> — tillgång till och portabilitet för data genererad av uppkopplade produkter och tjänster.</li>
  </ul>
  <p>
    Läs mer på <a href="https://digital-strategy.ec.europa.eu/en/policies/vision-data">EU:s datastrategi</a>
    och sök data på <a href="https://data.europa.eu/en">data.europa.eu</a>.
  </p>
</section>

<section class="section">
  <h2>Verktyg med nordisk eller EU-inriktning</h2>
  <div class="card-grid">
    {% assign intl_tools = site.tools | where_exp: "tool", "tool.region == 'eu' or tool.region == 'nordics'" %}
    {% for tool in intl_tools %}
    {% if tool.status == 'active' %}
    {% include card.html title=tool.title url=tool.link description=tool.content region=tool.region status=tool.status category=tool.category %}
    {% endif %}
    {% endfor %}
  </div>
</section>