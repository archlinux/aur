pkgname=ramme
pkgver=3.0.3
pkgrel=1
pkgdesc="Unofficial Instagram Desktop App"
arch=('x86_64')
url="https://github.com/terkelg/ramme/"
license=('MIT')
depends=('electron')
options=('!docs' '!emptydirs')
source=("https://github.com/terkelg/ramme/releases/download/v3.0.3/Ramme_3.0.3_amd64.deb")
md5sums=('e69bde9fe73124bf1ecd91e0fb792b55')
prepare() {
  ar vx Ramme_3.0.3_amd64.deb
}
package() {
  mkdir $pkgdir/opt/
  mkdir $pkgdir/opt/ramme
  tar xvf data.tar.xz -C "$pkgdir/"
}
