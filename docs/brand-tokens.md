# OKFN Network brand tokens — OpenGov.se

Derived from [Network - Brand Pack.pdf](../assets/Network%20-%20Brand%20Pack.pdf) (Nov 2023) and cross-checked against [okfn.org](https://okfn.org/) (OKFN Official palette).

## OKFN Official 4-color palette

| Token | Hex | Role |
|-------|-----|------|
| `--ok-primary` | `#00A9E0` | Links, active nav, primary actions |
| `--ok-highlight` | `#E4FF36` | Accent highlights, hover emphasis |
| `--ok-accent` | `#E077FF` | Secondary accent (sparingly) |
| `--ok-contrast` | `#030712` | Body text, dark footer background |

Supporting neutrals from OKFN web implementation:

| Token | Hex | Role |
|-------|-----|------|
| `--ok-surface` | `#F9F9F9` | Page background |
| `--ok-surface-raised` | `#FFFFFF` | Cards, header |
| `--ok-mint` | `#ADFFED` | Light tint for tags/filters |
| `--ok-muted` | `#6B7280` | Secondary text |
| `--ok-border` | `#E5E7EB` | Borders |

## Typography

| Use | Font | Fallback |
|-----|------|----------|
| Body | HK Grotesk | system-ui, sans-serif |
| Headings, labels, tags | Necto Mono | ui-monospace, monospace |

Fonts self-hosted from OKFN public assets (`assets/fonts/`).

## Sweden-only logos

Vendored under `assets/brand/se/` (see [assets/brand/README.md](../assets/brand/README.md)):

| Variant folder | Naming | Use |
|----------------|--------|-----|
| `Landscape/` | `OKSE-landscape-{white,black,grey,full}-rgb` | Horizontal logo with wordmark |
| `Portrait/` | `OKSE-portrait-{white,black,grey,full}-rgb` | Stacked layout |
| `No text/` | `OK-notext-{white,black,grey,full}` | Mark only |

Each variant ships in `1x`–`4x` PNG and `SVG`.

No other Network chapter logos on this site.

## Usage on opengov.se

- **Header:** opengov.se wordmark only; text link to OK Sverige
- **Footer:** `Landscape/SVG/OKSE-landscape-white-rgb.svg` + affiliation copy
- **Favicon:** `favicon-32.png` and `apple-touch-icon.png` (from `No text/OK-notext-full`)