# Author: Carlos Millán Soler <carmilso@upv.es>

pkgname=checkpkgs
pkgver=1.1
pkgrel=1
pkgdesc="Bash script to check updates of given packages with no need to update the local repositories."
arch=('any')
url="https://github.com/carmilso/$pkgname"
license=('GPL3')
source=("https://github.com/carmilso/$pkgname/releases/download/v$pkgver-$pkgrel/$pkgname-$pkgver-$pkgrel.tar.gz")
depends=('jq')

package() {
  cd "$pkgname-$pkgver-$pkgrel"
  make DESTDIR="$pkgdir" install
}
md5sums=('8e9bbd6d3e7571257d69cbbd481e292f')
