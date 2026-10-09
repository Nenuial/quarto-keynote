# quarto-keynote

Shared Reveal.js theme (`_extensions/keynote/`) plus one generated `<palette>-key` theme per palette. It is used by the GeoKey teaching decks and copied into `quarto-lddr` and `quarto-swissequestrian` by `sync-shared.sh`.

Read `docs/classes.md` before writing slide markup or CSS for a deck that uses these themes. It lists every class, attribute, token and script, and says where a new style belongs: structure in `keynote/`, colors in `palettes/`, and subject-specific styles in the deck itself.

- Never edit `_extensions/<name>-key/`: run `./generate-themes.sh`.
- After changing a shared file, run `./sync-shared.sh`. The LDDR and SE repositories need their own commit.
- `infographic.qmd` demoes `infographic.scss`. Render it with `--to <palette>-key-revealjs` to check a palette. Its output is ignored by git.
