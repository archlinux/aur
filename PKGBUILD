pkgname=ttf-agave
pkgver=008
pkgrel=1
url="https://alocy.be/page/agave"
license=('MIT')
pkgdesc='A TrueType monospaced font designed for X environments'
provides=('ttf-font')
arch=('any')
source=(
  "https://github.com/agarick/agave/raw/master/dist/agave-r.ttf"
  "https://github.com/agarick/agave/raw/master/dist/agave-r-just.ttf"
  "https://github.com/agarick/agave/raw/master/license.txt"
)
md5sums=(
  '8ac1c17d7ed29bb0dcce84253c1790b9'
  'a67f396e0a091d433cce5c32a0b6d5d7'
  'd5bb7f17d8d4c8e9bb1d715fdaeba8c9'
)
install=$pkgname.install

package() {
  install -dm755 "${pkgdir}"/usr/share/fonts/TTF 
  install -dm755 "${pkgdir}"/usr/share/licenses/${pkgname}/
  install -Dm644 "${srcdir}"/agave-r.ttf "${pkgdir}"/usr/share/fonts/TTF/
  install -Dm644 "${srcdir}"/agave-r-just.ttf "${pkgdir}"/usr/share/fonts/TTF/
  install -Dm644 license.txt "${pkgdir}"/usr/share/licenses/${pkgname}/
}