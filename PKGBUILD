# Maintainer:
# Contributor: Dylan Araps <dylan.araps@gmail.com>

_fontname="font-awesome"
_pkgname="ttf-$_fontname-4"
pkgbase="$_pkgname"
pkgver=4.7.0
pkgrel=7
pkgdesc="Iconic font designed for Bootstrap (version 4.x)"
url="https://github.com/FortAwesome/Font-Awesome"
license=('OFL-1.1')
arch=('any')

_pkgsrc="Font-Awesome-$pkgver"
source=(
  "$_fontname-$pkgver.tar.gz"::"https://github.com/FortAwesome/Font-Awesome/archive/v$pkgver.tar.gz"
  "LICENSE.OFL-1.1"
)
sha256sums=(
  'de512ba0e1dead382bbfce372cde74b3f18971d876fffb635ee9333f0db05d43'
  'fe4ddef88d2705569740a4b6c59e1a73315e1a55fb0a0d054bd791977681f8cb'
)

pkgname=(
  ttf-font-awesome-4
  otf-font-awesome-4
)

package_ttf-font-awesome-4() {
  install -Dm644 "$_pkgsrc"/fonts/*.ttf -t "$pkgdir/usr/share/fonts/TTF/"
  install -Dm644 "LICENSE.OFL-1.1" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_otf-font-awesome-4() {
  install -Dm644 "$_pkgsrc"/fonts/*.otf -t "$pkgdir/usr/share/fonts/OTF/"
  install -Dm644 "LICENSE.OFL-1.1" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
