# Author: Will Fleming <will@flemi.ng>
pkgname=gifcast
pkgver=0.1.0
pkgrel=1
pkgdesc="A simple GIF screen recorder"
arch=('any')
url="https://github.com/wfleming/$pkgname"
license=('MIT')
source=("https://github.com/wfleming/$pkgname/archive/v$pkgver.tar.gz")
depends=('recordmydesktop' 'ffmpeg' 'xorg-xwininfo' 'xrectsel')

package() {
  cd "$pkgname-$pkgver"

  make PREFIX=/usr DESTDIR="$pkgdir" install
}
md5sums=('1d4a19932ccf9045bbbc59c6a97ee50d')
