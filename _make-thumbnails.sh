#!/usr/bin/env bash
# Regenerate Book Notes listing thumbnails on the "Peak template":
# the cover art centred on a flat 16:9 canvas with ~15% margin all round,
# exported at 1200x675 so a 1-column phone at DPR 3 has headroom.
#
# Why: Quarto's grid thumbnail is a fluid-width / fixed-height box, so the crop
# window widens as the viewport narrows and object-fit: cover eats ~30% of the
# image height on a phone. Centring the subject with generous padding makes any
# residual crop harmless -- this is why 853-peak always looked right.
#
# Originals are never modified; output is thumb.png next to each source.
# Re-run after dropping in higher-resolution jacket art.
set -euo pipefail
cd "$(dirname "$0")/posts"

W=1200; H=675      # 16:9 canvas, matches the aspect-ratio in custom.scss
INNER=472          # ~70% of H -> ~15% margin top and bottom

# Cover sits on a flat colour sampled from the jacket. Seamless when the
# jacket's own background is flat.
solid() {  # dir src bg
  magick "$1/$2" -background "$3" -alpha remove -alpha off \
    -filter Lanczos -resize "x${INNER}" \
    -gravity center -background "$3" -extent "${W}x${H}" \
    -strip "$1/thumb.png"
  printf '  %-30s solid %s\n' "$1" "$3"
}

# Cover sits on a blurred, zoomed copy of itself, with a soft shadow so the
# inset reads as a deliberate card rather than a pasted rectangle. For jackets
# whose background is a gradient or two-tone, where a flat extend shows a seam.
blurred() {  # dir src
  magick \
    \( "$1/$2" -alpha remove -alpha off -resize "${W}x${H}^" \
       -gravity center -extent "${W}x${H}" -blur 0x36 -modulate 96 \) \
    \( "$1/$2" -alpha remove -alpha off -filter Lanczos -resize "x${INNER}" \
       \( +clone -background black -shadow 55x14+0+5 \) +swap \
       -background none -layers merge +repage \) \
    -gravity center -composite -strip "$1/thumb.png"
  printf '  %-30s blurred backdrop\n' "$1"
}

echo "Book Notes thumbnails -> ${W}x${H}, cover ${INNER}px tall:"
blurred 801-abramovich-ritov       book_cover.jpg
solid   851-good-habits-bad-habits book_cover.jpeg '#FCF8F9'
blurred 852-how-learning-works     book_cover.jpeg
solid   853-peak                   book_cover.jpeg '#FFFFFF'
solid   854-stolen-focus           book_cover.jpeg '#020005'
solid   855-war-of-art             book_cover.jpeg '#FFFFFF'
solid   856-making-of-a-manager    book_cover.jpeg '#81C7D1'
solid   857-who-gets-what-and-why  book_cover.jpeg '#FEFEFE'
solid   858-how-to-change          book_cover.png  '#FFFFFF'

# --- Solutions listing (defined inline in posts/index.qmd) ---
# A portrait jacket cannot be cropped to 16:9 without losing almost everything,
# so it sits whole on the site card colour, reading as a book object against the
# same field as the SVG cards. Source is vendored so nothing depends on an
# external URL.
magick -size "${W}x${H}" xc:'#35444E' \
  \( ../_thumbnail-sources/rizzo-cover.webp -alpha remove -alpha off \
     -filter Lanczos -resize "x${INNER}" \
     \( +clone -background black -shadow 60x16+0+6 \) +swap \
     -background none -layers merge +repage \) \
  -gravity center -composite -strip ../images/rizzo-thumb.png
printf '  %-30s card #35444E\n' "images/rizzo-thumb.png"
