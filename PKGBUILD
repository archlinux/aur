# Maintainer: Philipp Moeller <bootsarehax@gmail.com>
pkgname=ddate
pkgver=0.2
pkgrel=1
pkgdesc="PERPETUAL DATE CONVERTER FROM GREGORIAN TO POEE CALENDAR"
arch=('x86_64' 'i686' 'armv6h')
url="https://github.com/bo0ts/ddate"
license=(GPL)
depends=()
source=($pkgname-$pkgver.tar.gz::https://github.com/bo0ts/ddate/tarball/v0.2)

build() {
  cd $srcdir/bo0ts-ddate-4724229/
  make PREFIX="/usr"
}

package() {
  cd $srcdir/bo0ts-ddate-4724229/
  make PREFIX="$pkgdir/usr" install
}
md5sums=('b450f228c61ba2abd86641f11c5db27e')