pkgname=ttf-agave
pkgver=010
pkgrel=2
url="https://alocy.be/page/agave"
license=('MIT')
pkgdesc='A TrueType monospaced font designed for X environments'
provides=('ttf-font')
arch=('any')
source=(
  "https://github.com/agarick/agave/releases/download/v010/agave-r.ttf"
)
md5sums=('5148a5e1552d2ca03e97b54db366375f')

install=$pkgname.install

package() {
  install -dm755 "${pkgdir}"/usr/share/fonts/TTF 
  install -Dm644 "${srcdir}"/agave-r.ttf "${pkgdir}"/usr/share/fonts/TTF/
}
