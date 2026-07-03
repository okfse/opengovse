---
layout: page
title: Arkiv
permalink: /arkiv.html
---
<h1>Arkiv</h1>

<div class="archive-banner">
  <strong>Historiskt material.</strong>
  Sidorna i detta avsnitt speglar äldre OpenGov-initiativ och projekt som inte längre underhålls aktivt.
  De bevaras för referens och forskning.
</div>

<section class="section" id="historia">
  <h2>Historik</h2>
  <p>
    OpenGov.se startades som privat initiativ av Peter Krantz och har sedan vuxit till en gemensam ingång
    till verktyg, resurser och initiativ för öppna data och insyn i offentlig sektor i Sverige.
  </p>
  <p>
    Idag ägs och drivs sajten av
    <a href="https://okfn.se/">Open Knowledge Sverige</a> (org.nr 802494-0937).
    Vi välkomnar partners och sponsorer som vill bidra — kontakta
    <a href="mailto:info@opengov.se">info@opengov.se</a>.
  </p>
</section>

<section class="section">
  <h2>Äldre webbplats</h2>
  <ul>
    <li><a href="/opengov-se-pre2016.zip">OpenGov.se före 2016 (zip-arkiv)</a></li>
    <li><a href="{{ '/sidor/oppen-data/' | relative_url }}">Sju principer för öppen digital offentlig information (2009)</a></li>
    <li><a href="{{ site.posts.first.url | relative_url }}">Välkomna till nya OpenGov.se (2015)</a></li>
  </ul>
</section>

<section class="section">
  <h2>Arkiverade verktyg</h2>
  <div class="card-grid">
    {% assign archived_tools = site.tools | where: "status", "archived" %}
    {% for tool in archived_tools %}
    {% include card.html title=tool.title url=tool.link description=tool.content region=tool.region status=tool.status category=tool.category %}
    {% endfor %}
  </div>
</section>

<section class="section" id="lardigmer">
  <h2>Arkiverat läromaterial</h2>
  <p>
    Resurser som tidigare länkades från
    <a href="{{ '/lardigmer.html' | relative_url }}">Lär dig mer</a>
    men som inte längre är tillgängliga på sina ursprungliga adresser.
  </p>
  <div class="card-grid">
    {% for resource in site.data.archived-resources %}
    {% include card.html title=resource.title url=resource.url description=resource.description category=resource.category status='archived' %}
    {% endfor %}
  </div>
</section>

<section class="section">
  <h2>Historiska rapporter</h2>
  <p>
    Se avsnittet <em>Historiska</em> på
    <a href="{{ '/rapporter.html' | relative_url }}">rapportsidan</a>
    för äldre studier och analyser.
  </p>
</section>