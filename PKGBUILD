pkgname=ttf-agave
pkgver=10
pkgrel=4
url="https://alocy.be/page/agave"
license=('MIT')
pkgdesc='A TrueType monospaced font designed for X environments'
provides=('ttf-font')
arch=('any')
source=(
  "https://github.com/agarick/agave/releases/download/v10/agave-r.ttf"
)
md5sums=('19a74aa3a5bfdced057a1327a99baa99')

install=$pkgname.install

package() {
  install -dm755 "${pkgdir}"/usr/share/fonts/TTF 
  install -Dm644 "${srcdir}"/agave-r.ttf "${pkgdir}"/usr/share/fonts/TTF/
}
