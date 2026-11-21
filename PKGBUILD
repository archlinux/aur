# Maintainer: svgaming <svgaming234@gmail.com>

pkgname=cstats
pkgver=0.12.0
pkgrel=1
pkgdesc="Command-line RetroMC/BetaMC statistics tool"
arch=(any)
url="https://github.com/svgaming234/cstats"
license=('MIT')
depends=(
	'python'
	'python-requests'
)
source=("https://github.com/svgaming234/cstats/releases/download/v${pkgver}/cstats-v${pkgver}-python.py")
sha256sums=('58bed54c6601f533fdc5511455c69c25293ca51c6e42ddb82d4f0e2880067d46')

package() {
	install -Dm755 ./cstats-v${pkgver}-python.py "$pkgdir/usr/bin/$pkgname"
}
