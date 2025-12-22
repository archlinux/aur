pkgname=metal_time
pkgver=1.0
pkgrel=1
pkgdesc="Prints the current time using toilet"
arch=('any')
license=('MIT')

depends=('toilet')

source=('metal_time.sh')
sha256sums=('SKIP')


package() {
  install -Dm755 metal_time.sh "$pkgdir/usr/bin/metal_time"
}
