# Maintainer: svgaming <svgaming234@gmail.com>

pkgname=cstats
pkgver=0.9.1
pkgrel=1
pkgdesc="Command-line RetroMC statistics tool"
arch=(any)
url="https://github.com/svgaming234/cstats"
license=('MIT')
depends=(
	'python'
	'python-requests'
)
source=("https://github.com/svgaming234/cstats/releases/download/v${pkgver}/cstats-v${pkgver}-python.py")
sha256sums=('a072f0f9d95e8e062d33ff1d49d4146c1e61e0e77bb3b61e7aa10ce9664edaf0')

package() {
	install -Dm755 ./cstats-v${pkgver}-python.py "$pkgdir/usr/bin/$pkgname"
}
