---
layout: page
title: Användningsfall
permalink: /case.html
redirect_from:
  - /case/
---
<h1>{{ page.title }}</h1>
<p>Goda exempel där öppen data, transparens och medborgarinflytande skapat konkret nytta.</p>

<div class="card-grid">
  {% assign ordered_cases = site.cases | sort: "order" %}
  {% for case in ordered_cases %}
  {% include card.html title=case.title url=case.link description=case.content region=case.region status=case.status fallback_url=case.fallback_url mirror=case.mirror mirror_format=case.mirror_format primary_ok=case.primary_ok %}
  {% endfor %}
</div>

<p>
  <strong>Har du ett exempel att dela?</strong>
  Kontakta <a href="mailto:info@opengov.se">info@opengov.se</a> eller
  <a href="https://github.com/okfse/opengovse">bidra via GitHub</a>.
</p>