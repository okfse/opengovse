---
layout: page
title: Guide till strukturerad datadelning på Sveriges dataportal
permalink: /dela-data-dataportal.html
---

<h1>{{ page.title }}</h1>

<p>En enkel och praktisk introduktion till hur du gör dina datamängder synliga på Sveriges nationella dataportal – <a href="https://dataportal.se">dataportal.se</a>. Guiden är avsedd för dig som arbetar i offentlig sektor, i civilsamhället eller som privat aktör och vill dela data på ett strukturerat sätt.</p>

<section class="section" id="varfor">
  <h2>Varför dela data via dataportal.se?</h2>
  <p>Sveriges dataportal samlar information om datamängder från myndigheter, kommuner, regioner, företag och organisationer. När din metadata finns där blir datamängderna lätta att hitta – både för svenska användare och via EU:s gemensamma portal <a href="https://data.europa.eu">data.europa.eu</a>.</p>
  <p>Det handlar om att beskriva datamängderna på ett enhetligt sätt (med metadata) så att andra kan förstå vad som finns, hur man får tillgång till det och under vilka villkor det får användas.</p>
  <ul>
    <li>Ökad synlighet och återanvändning</li>
    <li>Automatisk synlighet på europeisk nivå</li>
    <li>Följer rekommendationer från DIGG (Myndigheten för digital förvaltning)</li>
  </ul>
</section>

<section class="section" id="forbered">
  <h2>Steg 0 – Förbered själva datat</h2>
  <p>Innan du beskriver datat behöver det finnas tillgängligt någonstans.</p>
  <ol>
    <li><strong>Tillgänglighet</strong>: Datafilerna eller API:et ska vara åtkomliga via en stabil webbadress (URL).</li>
    <li><strong>Format</strong>: Använd öppna och maskinläsbara format när det är möjligt (t.ex. CSV, JSON, XML).</li>
    <li><strong>Licens</strong>: Ange tydligt hur datat får användas. DIGG rekommenderar öppna licenser som CC0 (Public Domain) eller CC-BY för många fall. Se <a href="https://www.digg.se/kunskap-och-stod/oppna-och-delade-data/rekommendation-om-oppna-licenser-och-immaterialratt">DIGG:s rekommendationer för öppna licenser och immaterialrätt</a>.</li>
    <li><strong>Dokumentation</strong>: Skriv gärna en kort beskrivning av vad datamängden innehåller, hur ofta den uppdateras och eventuella begränsningar.</li>
  </ol>
  <p><strong>Obs:</strong> Det är skillnad på <em>öppna data</em> (fritt för alla att använda) och <em>delade data</em> (delas med vissa villkor eller till en avgränsad grupp). Båda kan beskrivas på dataportal.se.</p>
</section>

<section class="section" id="metadata">
  <h2>Vad är metadata och varför DCAT-AP-SE?</h2>
  <p>Metadata är information om datamängden – ungefär som en etikett på en burk som talar om vad som finns inuti, när den tillverkades och vem som står bakom.</p>
  <p>Sveriges dataportal använder standarden <strong>DCAT-AP-SE</strong> (en svensk anpassning av den europeiska DCAT-AP). Den gör att alla beskrivningar ser likadana ut och kan skördas automatiskt.</p>
  <p>Du behöver inte kunna standarden i detalj. De verktyg som beskrivs nedan hjälper dig att skapa rätt struktur.</p>
</section>

<section class="section" id="oversikt">
  <h2>Översikt över processen</h2>
  <ol>
    <li>Skapa en strukturerad beskrivning av dina datamängder (metadata).</li>
    <li>Gör beskrivningen tillgänglig på en webbadress (antingen som fil eller via ett verktyg).</li>
    <li>Registrera adressen som skördningskälla på <a href="https://admin.dataportal.se">admin.dataportal.se</a>.</li>
    <li>Vänta på skördning (oftast sker det nattligen) och testa gärna i sandbox-miljön först.</li>
  </ol>
</section>

<section class="section" id="metoder">
  <h2>Fyra vanliga sätt att skapa och dela metadata</h2>
  <p>Här är de metoder som många använder. Välj det som passar din organisation och tekniska förutsättningar.</p>

  <div class="card-grid">
    <article class="card">
      <h3>1. Editera.dataportal.se</h3>
      <p>En webbtjänst från DIGG där du kan hantera specifikationer och begrepp (terminologier). Bra när du vill beskriva informationsmodeller eller begrepp som ska återanvändas.</p>
      <p><strong>Så kommer du igång:</strong> Kontakta DIGG på <a href="mailto:info@digg.se">info@digg.se</a> för att få ett konto. Därefter loggar du in på <a href="https://editera.dataportal.se">editera.dataportal.se</a> och börjar lägga till eller redigera innehåll.</p>
      <p>Specifikationer och begrepp som hanteras här skördas automatiskt in till dataportal.se.</p>
    </article>

    <article class="card">
      <h3>2. Skriv en RDF-fil (statisk fil)</h3>
      <p>Du skapar en fil som följer DCAT-AP-SE och lägger upp den på din egen webbplats eller på GitHub Pages. Enkelt och effektivt för mindre organisationer eller projekt.</p>
      <p><strong>Exempel:</strong> Civic Tech Sweden publicerar sin metadata som en <a href="https://github.com/civictechsweden/civictech.se/blob/master/dcat-ap.rdf">dcat-ap.rdf</a>-fil.</p>
      <p><strong>Så gör du:</strong></p>
      <ul>
        <li>Ladda ner eller kopiera ett exempel.</li>
        <li>Anpassa titlar, beskrivningar, länkar till dina datafiler och licens.</li>
        <li>Lägg upp filen på en stabil adress (t.ex. <code>https://dinorganisation.se/data/dcat</code>).</li>
        <li>Se till att filen är publikt åtkomlig.</li>
      </ul>
      <p>Tips: Använd gärna Turtle eller RDF/XML. Det finns valideringsverktyg på <a href="https://docs.dataportal.se">docs.dataportal.se</a>.</p>
    </article>

    <article class="card">
      <h3>3. EntryScape (inkl. EntryScape Free)</h3>
      <p>EntryScape är ett verktyg byggt för länkad data och DCAT-AP. Det ger ett användarvänligt gränssnitt för att skapa kataloger, datamängder och distributioner.</p>
      <p><strong>EntryScape Free</strong> är en kostnadsfri variant som många kommuner, regioner och myndigheter använder. Kolla med din organisation om ni redan har det.</p>
      <p><strong>Så gör du:</strong></p>
      <ol>
        <li>Skapa/publicera din katalog i EntryScape.</li>
        <li>Gör katalog och datamängder publika för skördning.</li>
        <li>Kopiera länken (URI) till katalogen (via Exportera-knappen).</li>
        <li>Registrera länken på admin.dataportal.se.</li>
      </ol>
      <p>Läs mer: <a href="https://docs.entryscape.com/sv/catalog/dataportaler-skordning/">EntryScape-dokumentation om dataportaler och skördning</a>.</p>
    </article>

    <article class="card">
      <h3>4. CKAN</h3>
      <p>Flera offentliga organisationer internationellt använder CKAN som datakatalog. CKAN kan exportera metadata i format som är kompatibla med DCAT-AP och kan skördas av dataportal.se.</p>
      <p><strong>Så gör du:</strong></p>
      <ul>
        <li>Se till att din CKAN-instans är konfigurerad för DCAT-export eller att den exponerar data via API.</li>
        <li>Skapa en stabil URL som pekar till din katalogs metadata.</li>
        <li>Registrera URL:en på admin.dataportal.se.</li>
      </ul>
      <p>Kontakta din organisation och se om ni redan har CKAN i organisationen.</p>
    </article>
  </div>
</section>

<section class="section" id="registrera">
  <h2>Registrera din skördningskälla</h2>
  <p>När din metadata finns på en webbadress är nästa steg att tala om för dataportal.se var den finns.</p>

  <h3>Om du tillhör offentlig sektor</h3>
  <p>De flesta myndigheter, kommuner och regioner finns redan upplagda. Gå till <a href="https://admin.dataportal.se/status/public">admin.dataportal.se/status/public</a>, sök på din organisation och logga in (ofta via lösenordsåterställning på den e-postadress som är registrerad).</p>
  <p>Uppdatera skördningslänken under din organisations information.</p>

  <h3>Om du är privat, ideell eller annan aktör</h3>
  <p>Skapa ett konto på <a href="https://admin.dataportal.se/signup">admin.dataportal.se/signup</a>. Gå sedan till Organisationer och lägg till din katalog med titel, beskrivning och skördningskälla (URL till din DCAT-fil eller katalog).</p>

  <h3>Sandbox för test</h3>
  <p>Använd alltid <a href="https://sandbox.admin.dataportal.se">sandbox.admin.dataportal.se</a> och <a href="https://www-sandbox.dataportal.se">www-sandbox.dataportal.se</a> för att testa att allt fungerar innan du registrerar på produktionsmiljön.</p>
</section>

<section class="section" id="tips">
  <h2>Praktiska tips</h2>
  <ul>
    <li><strong>Validera</strong>: Använd verktygen på docs.dataportal.se för att kontrollera att din metadata följer DCAT-AP-SE.</li>
    <li><strong>Uppdatera regelbundet</strong>: Om datamängderna ändras – uppdatera även metadata (datum, beskrivning, länkar).</li>
    <li><strong>Licens är viktig</strong>: Utan tydlig licens är det svårt för andra att veta vad de får göra med datat.</li>
    <li><strong>Skördning tar tid</strong>: Ändringar syns oftast inom ett dygn.</li>
    <li><strong>Delad katalog</strong>: Om ni saknar egen lösning kan ni kontakta DIGG om att använda deras delade metadatakatalog.</li>
  </ul>
</section>

<section class="section" id="resurser">
  <h2>Viktiga resurser</h2>
  <ul>
    <li><a href="https://www.digg.se/kunskap-och-stod/regler-och-rekommendationer/regler-och-rekommendationer/oppna-upp-och-dela-data-via-sveriges-dataportal">DIGG – Öppna upp och dela data via Sveriges dataportal</a> (rekommenderad vägledning)</li>
    <li><a href="https://docs.dataportal.se/">Dokumentation för Sveriges dataportal</a> (DCAT-AP-SE, skördning, exempel, FAQ)</li>
    <li><a href="https://admin.dataportal.se">admin.dataportal.se</a> – registrera och följ skördning</li>
    <li><a href="https://docs.entryscape.com/sv/catalog/dataportaler-skordning/">EntryScape – Dataportaler och skördning</a></li>
    <li><a href="https://editera.dataportal.se">editera.dataportal.se</a> – för specifikationer och begrepp</li>
    <li><a href="https://data.europa.eu">data.europa.eu</a> – den europeiska portalen</li>
  </ul>
</section>

<section class="section" id="bidra">
  <h2>Har du fler sätt att dela data?</h2>
  <p>Denna guide beskriver några vanliga metoder (Editera, statisk RDF, EntryScape och CKAN), men det finns säkert fler.</p>
  <p>Känner du till andra verktyg, plattformar, API:er, eller smarta arbetssätt för att publicera strukturerad metadata som skördas till dataportal.se?</p>
  <p>Hjälp till att göra guiden bättre för alla!</p>
  <ul>
    <li><a href="https://github.com/okfse/opengovse">Öppna en pull request eller issue på GitHub</a></li>
    <li>Mejla <a href="mailto:info@opengov.se">info@opengov.se</a></li>
  </ul>
</section>

<p class="meta">Senast uppdaterad: 2026-07. Bidra gärna med förbättringar via <a href="https://github.com/okfse/opengovse">GitHub</a> eller mejla <a href="mailto:info@opengov.se">info@opengov.se</a>.</p>
