# Author: Carlos Millán Soler <carmilso@upv.es>

pkgname=checkpkgs
pkgver=1.0
pkgrel=2
pkgdesc="Bash script for checking updates of given packages"
arch=('any')
url="https://github.com/carmilso/$pkgname"
license=('GPL3')
conflicts=('checkpkg')
source=("https://github.com/carmilso/$pkgname/releases/download/v$pkgver-$pkgrel/$pkgname-$pkgver-$pkgrel.tar.gz")

package() {
  cd "$pkgname-$pkgver-$pkgrel"
  make DESTDIR="$pkgdir" install
}
md5sums=('a14036dc3ede0c916a169c02ad14f804')
