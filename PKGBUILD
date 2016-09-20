# Maintainer: Quint Guvernator <quint at guvernator.net>

pkgname=loadstat
pkgver=0.1.1
pkgrel=2
pkgdesc='Calculate load averages adjusted by number of cores'
url="https://github.com/qguv/$pkgname"
arch=('i686' 'x86_64')
license=('GPL')
source=("https://github.com/qguv/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('cf1a155310f2c1e48ef338ef8f8ba9b63ab86fc19da0e87e634acc417d7314ca')

build() {
  cd "$srcdir/${pkgname}-$pkgver"
  sh build.sh
}

package() {
  cd "$srcdir/${pkgname}-$pkgver"
  install -Dt "$pkgdir/usr/bin" "$pkgname"
}
