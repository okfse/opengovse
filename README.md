# opengov.se

Hemsida för samlingsplats av transparensprojekt i Sverige.

## Utveckling

Kräver Ruby 3.3 eller nyare (inkl. Ruby 4 på Ubuntu 26.04) och Bundler.

Om du använder `rbenv`/`asdf` och vill matcha CI exakt: `ruby 3.3.4` (se `.ruby-version`).
Utan version manager fungerar systemets Ruby 4.0.5 efter `bundle install`.

```bash
bundle install
```

Jekyll 4 installeras via Bundler i projektet (`gem "jekyll", "~> 4.4"` i `Gemfile`) — du behöver inte installera Jekyll separat.

**Använd alltid `bundle exec`** framför `jekyll` och `htmlproofer`. Om du kör systemets `jekyll` (t.ex. `/usr/bin/jekyll` från Ubuntu) kan du få fel som:

```text
You have already activated public_suffix 6.0.2, but your Gemfile requires public_suffix 7.0.5
```

Lösning: `bundle exec jekyll build` i stället för `jekyll build`.

Sajten byggs med **Jekyll 4** och publiceras via **GitHub Actions** till [opengov.se](https://opengov.se).

### Verifiera lokalt (samma steg som CI)

Kör från projektroten innan du committar och pushar:

```bash
bundle exec jekyll build --trace
bundle exec htmlproofer ./_site --disable-external --allow-hash-href --no-enforce-https
```

Valfritt — kontrollera verktygslänkar (CI kör detta med `continue-on-error`):

```bash
./scripts/check-tool-links.sh
```

Lägg till `--fail-on-error` om du vill att skriptet ska avbryta vid trasiga länkar till aktiva verktyg.

### Förhandsgranska i webbläsaren

```bash
bundle exec jekyll serve
```

Öppna [http://127.0.0.1:4000/](http://127.0.0.1:4000/). Avsluta med `Ctrl+C` eller:

```bash
pkill -f 'jekyll serve'
```

### Brancher och publicering

| Branch | Roll | Deploy vid push |
|--------|------|-----------------|
| `develop` | Standard; dagligt arbete | Nej |
| `main` | Release-grind | Nej |
| `gh-pages` | Produktion → [opengov.se](https://opengov.se) | Ja |

Flöde: feature-branch → PR → `develop` → PR → `main` → PR → `gh-pages`.

Pull requests mot `develop`, `main` eller `gh-pages` kör build och HTML Proofer i [GitHub Actions](https://github.com/okfse/opengovse/actions). Endast push till `gh-pages` publicerar sajten.

### Publicera

```bash
git checkout develop
git pull origin develop
git checkout -b din-feature-branch
# ... gör ändringar ...
git add -A
git commit -m "Beskriv din ändring"
git push origin din-feature-branch
```

Öppna en pull request mot `develop`. När ändringen ska ut live: PR `develop` → `main`, sedan PR `main` → `gh-pages`.

## Bidra

Tips om verktyg, rapporter och länkar tas emot via [GitHub Issues](https://github.com/okfse/opengovse/issues).

## Licens

OpenGov.se är licensierad under Creative Commons Zero (Public Domain).