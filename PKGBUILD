# Maintainer: hexchain <i at hexchain dot org>

pkgname=mdevctl
pkgver=0.78
pkgrel=1
pkgdesc="A mediated device management utility for Linux"
url="https://github.com/mdevctl/mdevctl"
arch=('any')
license=('LGPL2.1')
depends=('bash')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mdevctl/mdevctl/archive/$pkgver.tar.gz")
sha256sums=('58d72bd805dd934c247089dbb59f062c60bc9aab1585322702f2c2f09ca2815b')
options+=(emptydirs)

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir" SBINDIR="\$(PREFIX)/bin" install
}
