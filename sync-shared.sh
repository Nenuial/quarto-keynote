#!/usr/bin/env bash
# Copies the shared keynote theme into themes that live in other repositories.
#
# `quarto add` rejects an extension whose filters or plugins point outside its own
# repository, so those themes carry a copy in a `keynote/` subfolder instead of
# referencing ../keynote. Run this after changing the shared files, then commit
# the copies in each target repository.
#
# Usage: ./sync-shared.sh [extension-dir ...]
# Defaults to the LDDR and Swiss Equestrian themes next to this repository.

set -euo pipefail
cd "$(dirname "$0")"

src=_extensions/keynote
shared=(global.scss letterbox.scss timeline.scss custom-callouts.scss theme.html custom-callouts.lua codewindow)
version=$(sed -n 's/^version: *//p' "$src/_extension.yml")

if [ $# -eq 0 ]; then
  set -- ../quarto-lddr/_extensions/lddr-key ../quarto-swissequestrian/_extensions/se-slides
fi

for target in "$@"; do
  if [ ! -f "$target/_extension.yml" ]; then
    echo "skip: $target is not an extension" >&2
    continue
  fi
  rm -rf "$target/keynote"
  mkdir -p "$target/keynote"
  for f in "${shared[@]}"; do
    cp -R "$src/$f" "$target/keynote/"
  done
  printf 'Copied from nenuial/quarto-keynote %s by sync-shared.sh. Do not edit here.\n' "$version" > "$target/keynote/VERSION"
  echo "$target <- keynote $version"
done
