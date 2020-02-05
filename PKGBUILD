# Maintainer: Aphek <bilkow at tutanota com>
pkgname=nx-udev
pkgver=0.1.0
pkgrel=1
pkgdesc="udev rule for the Nintendo Switch"
arch=('any')
url="https://github.com/pheki/nx-udev"
license=('GPL3')
groups=()
depends=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/pheki/nx-udev/archive/v$pkgver.tar.gz")
sha256sums=('174e1b569ffccece5bdf517835b54c91f62b1922452fb59c855ec3680f1d1491')

package() {
    install -Dm 644 "$pkgname-$pkgver"/60-nx.rules "$pkgdir"/usr/lib/udev/rules.d/60-nx.rules
}
