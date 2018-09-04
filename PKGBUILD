pkgname=ramme
pkgver=3.2.5
pkgrel=1
pkgdesc="Unofficial Instagram Desktop App"
arch=('x86_64')
url="https://github.com/terkelg/ramme/"
license=('MIT')
depends=('electron' 'gconf')
options=('!docs' '!emptydirs')
source=("https://github.com/terkelg/ramme/releases/download/v3.2.5/Ramme_3.2.5_amd64.deb")
md5sums=('51522f01febc31a3c1eb9edeb018af4d')
prepare() {
  ar vx Ramme_3.2.5_amd64.deb
}
package() {
  mkdir $pkgdir/opt/
  mkdir $pkgdir/opt/ramme
  tar xvf data.tar.xz -C "$pkgdir/"
}
