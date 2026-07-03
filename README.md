# opengov.se

Hemsida för samlingsplats av transparensprojekt i Sverige.

## Utveckling

Kräver Ruby 3.3 eller nyare (inkl. Ruby 4 på Ubuntu 26.04) och Bundler.

```bash
bundle install
bundle exec jekyll serve
```

Om du använder `rbenv`/`asdf` och vill matcha CI exakt: `ruby 3.3.4` (se `.ruby-version`).
Utan version manager fungerar systemets Ruby 4.0.5 efter `bundle install`.

Sajten byggs med **Jekyll 4** och publiceras via **GitHub Actions** till [opengov.se](https://opengov.se).

## Bidra

Tips om verktyg, rapporter och länkar tas emot via [GitHub Issues](https://github.com/okfse/opengovse/issues).

## Licens

OpenGov.se är licensierad under Creative Commons Zero (Public Domain).