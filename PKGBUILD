# Maintainer: Aphek <bilkow at tutanota com>
pkgname=nx-udev
pkgver=0.1.1
pkgrel=1
pkgdesc="udev rule allowing communication with the Nintendo Switch without root"
arch=('any')
url="https://github.com/pheki/nx-udev"
license=('GPL3')
groups=()
depends=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/pheki/nx-udev/archive/v$pkgver.tar.gz")
sha256sums=('36c9a12f27eac97230718f08ed40bfa73800bb9ea71b863b789a610d449be50b')

package() {
    install -Dm 644 "$pkgname-$pkgver"/60-nx.rules "$pkgdir"/usr/lib/udev/rules.d/60-nx.rules
    install -Dm 644 "$pkgname-$pkgver"/60-nx-rcm.rules "$pkgdir"/usr/lib/udev/rules.d/60-nx-rcm.rules
}
