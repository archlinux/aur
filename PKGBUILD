pkgname=ramme
pkgver=3.2.3
pkgrel=1
pkgdesc="Unofficial Instagram Desktop App"
arch=('x86_64')
url="https://github.com/terkelg/ramme/"
license=('MIT')
depends=('electron' 'gconf')
options=('!docs' '!emptydirs')
source=("https://github.com/terkelg/ramme/releases/download/v3.2.3/Ramme_3.2.3_amd64.deb")
md5sums=('b7333cab8f470e8df90dd4c29ef07d9c')
prepare() {
  ar vx Ramme_3.2.3_amd64.deb
}
package() {
  mkdir $pkgdir/opt/
  mkdir $pkgdir/opt/ramme
  tar xvf data.tar.xz -C "$pkgdir/"
}
