# Maintainer: Salif Mehmed <salif@programmer.net>
pkgname=projstats
pkgver=1908.1.0
pkgrel=1
pkgdesc="Count source lines of code"
arch=("x86_64")
url="https://github.com/salifm/projstats"
license=("MIT")
depends=("jre11-openjdk")
source=("$pkgname-$pkgver-linux.zip::https://github.com/salifm/projstats/releases/download/v${pkgver}/projstats-v${pkgver}-linux.zip")
sha512sums=('0bf529fc23365a5cff05b4ab1cc0cacde9c19717c8ad7bdabd8b38255bb621571324682df8ee70240ebc1061caf552f1f574560e7c1d39987664fb36cb03157f')
package() {
  cd "$pkgname-v$pkgver-linux"
  make DESTDIR="$pkgdir/" install
}
