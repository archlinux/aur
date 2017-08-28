# Author: Carlos Millán Soler <carmilso@upv.es>

pkgname=checkpkg
pkgver=1.0
pkgrel=1
pkgdesc="Bash script for checking updates of given packages"
arch=('any')
url="https://github.com/carmilso/$pkgname"
license=('GPL3')
source=("https://github.com/carmilso/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
md5sums=('7d31957d33f67e6051f06d0d7052d1ba')
