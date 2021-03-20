pkgname=ttf-agave
pkgver=37
pkgrel=1
url="https://alocy.be/page/agave"
license=('MIT')
pkgdesc='A TrueType monospaced font designed for X environments'
provides=('ttf-font')
arch=('any')
source=(
  "https://github.com/agarick/agave/releases/download/v$pkgver/Agave-Regular.ttf"
)
md5sums=('037aed0f8470eb82ab3c63ba04b2ba2a')

install=$pkgname.install

package() {
  install -dm755 "${pkgdir}"/usr/share/fonts/TTF 
  install -Dm644 "${srcdir}"/Agave-Regular.ttf "${pkgdir}"/usr/share/fonts/TTF/agave-r.ttf
}
