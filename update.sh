#!/bin/bash

set -euo pipefail

_dir=$(realpath "$(dirname "$BASH_SOURCE")")
_pkgname=wiki-loves-earth-wallpapers
_pkgver=0
_json=$_dir/$_pkgname.json
_xml=$_dir/$_pkgname.xml
_agent=$(printf '%s (https://aur.archlinux.org/packages/%s/ %s) curl/%s' \
    "${0##*/}" "$_pkgname" "aur@lkr.ms" \
    "$(curl --version | awk 'NR == 1 { print $2 }')")
_temp=$(mktemp)

if [ ! -s "$_json" ] || [ "${1-}" != --no-fetch ]; then
    : >"$_json"

    _wiki_json() {
        local args=() query url
        set -- "$@" format=json
        while (($#)); do
            args+=(--arg "${1%%=*}" "${1#*=}")
            shift
        done
        mkdir -p "$_dir/tmp" &&
            query=$(jq -rn "${args[@]}" '
[ $ARGS.named | to_entries[] | "\(.key)=\(.value|@uri)" ] | join("&")') &&
            url="https://commons.wikimedia.org/w/api.php?$query" &&
            curl -fsSLA "$_agent" "$url" |
            tee "$_dir/tmp/$(date +"%s")-$(sed -E 's/[/:]+/__/g; s/^(.{239}).*/\1/' <<<"$url").json"
    }

    while IFS= read -r page; do
        [ -n "$page" ] || continue
        if [[ ! $page =~ (^|[^0-9])(2[0-9]{3})($|[^0-9]) ]]; then
            echo "ERROR: no competition year in '$page'"
            exit 1
        fi
        year=${BASH_REMATCH[2]}

        echo "Parsing '$page'..." >&2
        section=$(_wiki_json action=parse \
            page="$page" prop=sections | jq -r '
[ .parse.sections[] | select(.line | test("winners$"; "i")) ] | first | .index')
        if [ -z "$section" ]; then
            echo "ERROR: no \"winners\" section on '$page'" >&2
            exit 1
        fi

        echo "Parsing '$page' section #$section..." >&2
        titles=$(_wiki_json action=parse \
            page="$page" section="$section" prop=images | jq -r '
[ .parse.images[] | select(test("\\.jpe?g$";"i")) | "File:" + . ] | join("|")')
        if [ -z "${titles:+1}" ]; then
            echo "ERROR: no images on '$page'" >&2
            exit 1
        fi

        echo "Retrieving image information..." >&2
        _wiki_json action=query titles="$titles" prop=imageinfo \
            iiprop="canonicaltitle|extmetadata|sha1|size|url" |
            jq -r --arg titles "$titles" --arg year "$year" '
(.query.normalized | map( { (.from): .to } ) | add) as $normalized |
  ($titles | split("|") | to_entries |
    map( { ($normalized[.value] // .value): .key } ) | add) as $titles |
  [ .query.pages[] | [.pageid, .title] as [$pageid, $title] | .imageinfo[0] |
    select(.width > .height and .width >= 1920 and .height >= 1080 and
        .canonicaltitle == $title) |
    .year = ($year | tonumber) |
    .index = $titles[$title] |
    .file = .canonicaltitle[5:] |
    .pageid = $pageid ] |
  sort_by(.index) | .[]' >"$_temp"
        if [ ! -s "$_temp" ]; then
            echo "ERROR: no hi-res landscape images on '$page'" >&2
            exit 1
        fi

        cat "$_temp" >>"$_json"
    done < <(
        echo "Parsing 'Commons:Wiki Loves Earth'..." >&2
        _wiki_json action=parse page="Commons:Wiki Loves Earth" prop=links |
            jq -r '.parse.links[]["*"] | select(test("/winners$";"i"))'
    )
fi

_pkgver=$(jq -s '[ .[].year ] | max' <"$_json")
_count=$(jq -s 'length' <"$_json")

echo "$_count images found" >&2

#local xml=$pkgdir/usr/share/gnome-background-properties/$pkgname.xml \
cat <<XML >"$_xml"
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE wallpapers SYSTEM "gnome-wp-list.dtd">
<wallpapers>
XML

i=0
while IFS=$'\t' read -r file pageid; do
    ((++i))
    pkgfile=$(printf '/usr/share/backgrounds/%s/%03d-%s.jpg\n' \
        "$_pkgname" "$i" "$pageid")
    cat <<XML >>"$_xml"
  <wallpaper deleted="false">
    <name>${file%.*}</name>
    <filename>${pkgfile}</filename>
  </wallpaper>
XML
done < <(jq -r '[.file, .pageid] | @tsv' <"$_json")

cat <<XML >>"$_xml"
</wallpapers>
XML

cat <<EOF >"$_dir/PKGBUILD"
pkgname=$_pkgname
pkgver=$_pkgver
pkgrel=1
pkgdesc="Use images from Wikipedia's 'Wiki Loves Earth' annual photographic competition on your desktop"
url="https://wikilovesearth.org"
arch=('any')
license=('CCPL')
depends=()
makedepends=('imagemagick')
source=(
    "\${pkgname}.xml"
$(jq -r '"image-\(.pageid).jpg::" + .url | @sh | "    \(.)"' <"$_json")
)
sha1sums=(
$(sha1sum "$_xml" | awk "{print \"    '\" \$1 \"'\"}" &&
    jq -r '.sha1 | @sh | "    \(.)"' <"$_json")
)
noextract=("\${source[@]%%::*}")

# Use --remote-time to retain image timestamps
DLAGENTS=(
    'http::/usr/bin/curl -qgb "" -fLC - --retry 3 --retry-delay 3 --remote-time -o %o %u'
    'https::/usr/bin/curl -qgb "" -fLC - --retry 3 --retry-delay 3 --remote-time -o %o %u'
)

prepare() {
    local count image images=("\${source[@]:1}") i=-1
    install -d "\$srcdir/\$pkgname"
    echo "Resampling \${count:=\${#images[@]}} images..." >&2
    for image in "\${images[@]%%::*}"; do
        ((++i)) || continue
        echo "-> (\$i/\$count) \$image" >&2
        file=\$srcdir/\$pkgname/\$image
        if [ -f "\$file" ]; then
            continue
        fi
        convert "\$srcdir/\$image" \\
            -resize '3840x2400^>' \\
            -quality 80 \\
            -sampling-factor 4:2:0 \\
            "\$file"
        touch -r "\$srcdir/\$image" "\$file"
    done
}

package() {
    local image images=("\${source[@]:1}") i=-1 file
    install -d "\$pkgdir/usr/share/backgrounds/\$pkgname"
    for image in "\${images[@]%%::*}"; do
        ((++i)) || continue
        file=\$(printf '%s/usr/share/backgrounds/%s/%03d-%s\n' \\
            "\$pkgdir" "\$pkgname" "\$i" "\$image")
        image=\$srcdir/\$pkgname/\$image
        install -p "\$image" "\$file"
    done
    install -D "\$srcdir/\$pkgname.xml" \\
        "\$pkgdir/usr/share/gnome-background-properties/\$pkgname.xml"
}
EOF
