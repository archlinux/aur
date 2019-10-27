pkgname=ttf-agave
pkgver=14
pkgrel=1
url="https://alocy.be/page/agave"
license=('MIT')
pkgdesc='A TrueType monospaced font designed for X environments'
provides=('ttf-font')
arch=('any')
source=(
  "https://github.com/agarick/agave/releases/download/v14/Agave-Regular.ttf"
)
md5sums=('c47a0fea5d45393189b970a1e6db7a95')

install=$pkgname.install

package() {
  install -dm755 "${pkgdir}"/usr/share/fonts/TTF 
  install -Dm644 "${srcdir}"/Agave-Regular.ttf "${pkgdir}"/usr/share/fonts/TTF/agave-r.ttf
}
