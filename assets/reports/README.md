# Mirrored reports

Local copies of reports linked from [rapporter.html](https://opengov.se/rapporter.html). Files are fetched from the original publisher, a curated fallback host, or the [Internet Archive Wayback Machine](https://web.archive.org/) when the primary link no longer works.

- `manifest.json` maps each primary URL to its local file and resolution metadata.
- Re-run `./scripts/check-links.sh --mirror-reports` to refresh mirrors (use `--force` to re-download).

These files are upstream copies kept for archival fallback. Rights remain with the original publishers.

Archived HTML pages may contain broken internal links to their original host — that is expected. HTML Proofer skips `assets/reports/*.html` for this reason.

As of the last mirror run, the McKinsey report (2013) could not be resolved automatically (host blocks automated access and no stable Wayback PDF was found). Add a curated entry to `_data/report_fallbacks.yml` when a working URL is identified.