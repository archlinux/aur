pkgname=ttf-agave
pkgver=008
pkgrel=2
url="https://alocy.be/page/agave"
license=('MIT')
pkgdesc='A TrueType monospaced font designed for X environments'
provides=('ttf-font')
arch=('any')
source=(
  "https://github.com/agarick/agave/raw/master/dist/agave-r.ttf"
  "https://github.com/agarick/agave/raw/master/dist/agave-r-just.ttf"
  "https://github.com/agarick/agave/raw/master/LICENSE"
)
md5sums=(
  '8ac1c17d7ed29bb0dcce84253c1790b9'
  'a67f396e0a091d433cce5c32a0b6d5d7'
  'eede85798400260e219a6ecd25586453'
)
install=$pkgname.install

package() {
  install -dm755 "${pkgdir}"/usr/share/fonts/TTF 
  install -dm755 "${pkgdir}"/usr/share/licenses/${pkgname}/
  install -Dm644 "${srcdir}"/agave-r.ttf "${pkgdir}"/usr/share/fonts/TTF/
  install -Dm644 "${srcdir}"/agave-r-just.ttf "${pkgdir}"/usr/share/fonts/TTF/
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/
}