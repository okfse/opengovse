# OpenGov.se audit — March 2026

Baseline audit before Jekyll 4 modernization.

## Stack (before → after)

| Component | Before | After |
|-----------|--------|-------|
| Jekyll | 2.4.0 (github-pages gem 40) | 4.4.x |
| Ruby | unspecified | 3.3.4 |
| CSS | Bootstrap 3 + SASS | Custom CSS variables |
| Deploy | Legacy gh-pages branch build | GitHub Actions + deploy-pages |
| JS | Missing vendor files + rawgit | Minimal vanilla `assets/js/main.js` |

## Fixed issues

- **Twitter timeline widget** removed from homepage (deprecated embed API)
- **cdn.rawgit.com** ok-panel script removed
- **Waffle.io** and **Quitter.se** references removed
- **SVT Flash iframe** removed from learning page
- **Invalid mailto** obfuscation fixed (`info@opengov.se`)
- **Broken HTML** in verktyg.md (Postnummerupproret missing `</a>`) — migrated to collection
- **Invalid anchor IDs** in rapporter.md (`id="#varde"`) — replaced with data-driven layout
- **Denmark/Finland label error** in rapporter.md — corrected in `_data/reports.yml`
- **`_config.yml` URL** set to `https://opengov.se`
- **alpha badge** and IE8 banner removed
- **`about.md`** Jekyll boilerplate removed
- **Missing `js/`** references replaced with `assets/js/main.js`

## Preserved archive material

- `/sidor/oppen-data/` — 2009 principles (`principer.md`) with archive banner
- `/opengov-se-pre2016.zip` — pre-2016 site download
- 2015 relaunch blog post
- Archived tools (GODI, LODI, Creeper, Twitter bots, etc.) under `/arkiv.html`

## Link audit recommendation

Run on each PR (internal links only in CI; external manually quarterly):

```bash
bundle exec jekyll build
bundle exec htmlproofer _site --check-html --disable-external true
# Optional: lychee _site --exclude-mail --max-redirects 5
```

High-link pages to spot-check externally: `lardigmer.md`, `_data/reports.yml`, `_tools/`.

## Brand alignment (OKFN Network Brand Pack)

- OKFN Official palette applied via CSS variables (`#00A9E0`, `#E4FF36`, `#E077FF`, `#030712`)
- Typography: HK Grotesk + Necto Mono (self-hosted from okfn.org assets)
- Sweden-only logos vendored in `assets/brand/se/`
- OK Sverige branding primarily in footer; opengov.se wordmark in header
- See `docs/brand-tokens.md` for full token reference

## Remaining manual checks

- Verify OK Sweden social accounts still active
- Confirm third-party `.se` project URLs annually
- Move `opengov-se-pre2016.zip` to GitHub Release when convenient (reduces repo size)