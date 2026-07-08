---
layout: page
title: Sverige
permalink: /sverige.html
---
<h1>Öppenhet i Sverige</h1>
<p>
  Sverige har en stark offentlighetsprincip och växande mängd öppna data.
  Här samlar vi portaler, myndigheter och verktyg med svensk inriktning.
</p>

<section class="section">
  <h2>Dataportaler och myndigheter</h2>
  <div class="card-grid">
    {% for portal in site.data.portals.sweden %}
    {% include card.html title=portal.name url=portal.url description=portal.description region="sweden" status="active" %}
    {% endfor %}
  </div>
  <p>Se också vår <a href="{{ '/dela-data-dataportal.html' | relative_url }}">guide till strukturerad datadelning</a> om du vill göra dina egna datamängder synliga på dataportal.se.</p>
</section>

<section class="section">
  <h2>Rättigheter och insyn</h2>
  <ul>
    <li><strong>Offentlighetsprincipen</strong> — grundläggande rätt att ta del av allmänna handlingar.</li>
    <li><a href="https://allmanhandling.se">AllmänHandling.se</a> — guider och rättsfall.</li>
    <li><a href="https://handlingar.se/sv">Handlingar.se</a> — digital begäran om handlingar.</li>
    <li><a href="https://www.jo.se/">JO</a> — Justitieombudsmannen granskar myndigheter.</li>
    <li><a href="https://www.imy.se/">IMY</a> — Integritetsskyddsmyndigheten.</li>
  </ul>
</section>

<section class="section">
  <h2>Svenska verktyg</h2>
  <div class="card-grid">
    {% assign swedish_tools = site.tools | where: "region", "sweden" | where: "status", "active" %}
    {% for tool in swedish_tools %}
    {% include card.html title=tool.title url=tool.link description=tool.content region=tool.region status=tool.status category=tool.category %}
    {% endfor %}
  </div>
</section>

<section class="section">
  <h2>Internationellt samarbete</h2>
  <p>
    Sverige deltar i <a href="https://www.opengovpartnership.org/country/sweden">Open Government Partnership</a>
    och implementerar EU:s regelverk för öppna data via DIGG och nationella dataportaler.
  </p>
</section>