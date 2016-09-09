# Maintainer: Quint Guvernator <quint at guvernator.net>

pkgname=loadstat
pkgver=0.1.1
pkgrel=1
pkgdesc="Calculate load averages adjusted by number of cores"
url="https://github.com/qguv/loadstat"
arch=('i686' 'x86_64')
license=('GPL')
source=("https://github.com/qguv/$pkgname/archive/$pkgver.tar.gz")
md5sums=('08ce7bdcf3b8efb01edb87b133bda24d')

build() {
  cd "$srcdir/${pkgname}-$pkgver"
  sh build.sh
}

package() {
  cd "$srcdir/${pkgname}-$pkgver"
  install -Dt $pkgdir/usr/bin "$pkgname"
}
