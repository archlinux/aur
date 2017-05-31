pkgname=ramme
pkgver=3.2.2
pkgrel=1
pkgdesc="Unofficial Instagram Desktop App"
arch=('x86_64')
url="https://github.com/terkelg/ramme/"
license=('MIT')
depends=('electron' 'gconf')
options=('!docs' '!emptydirs')
source=("https://github.com/terkelg/ramme/releases/download/v3.2.2/Ramme_3.2.2_amd64.deb")
md5sums=('257e4b6ee30a212d468ba8fe6f435556')
prepare() {
  ar vx Ramme_3.1.0_amd64.deb
}
package() {
  mkdir $pkgdir/opt/
  mkdir $pkgdir/opt/ramme
  tar xvf data.tar.xz -C "$pkgdir/"
}
