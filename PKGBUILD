pkgname=ramme
pkgver=3.1.0
pkgrel=1
pkgdesc="Unofficial Instagram Desktop App"
arch=('x86_64')
url="https://github.com/terkelg/ramme/"
license=('MIT')
depends=('electron' 'gconf')
options=('!docs' '!emptydirs')
source=("https://github.com/terkelg/ramme/releases/download/v3.1.0/Ramme_3.1.0_amd64.deb")
md5sums=('21c16d2aa21d8601f479a819e5189fa9')
prepare() {
  ar vx Ramme_3.1.0_amd64.deb
}
package() {
  mkdir $pkgdir/opt/
  mkdir $pkgdir/opt/ramme
  tar xvf data.tar.xz -C "$pkgdir/"
}
