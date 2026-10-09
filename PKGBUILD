# Maintainer: svgaming <svgaming234@gmail.com>

pkgname=cstats
pkgver=0.11.0
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
sha256sums=('abffe5f6a9a3bd6237187c1d14433b785703899380818b5a72e926c3a917bbff')

package() {
	install -Dm755 ./cstats-v${pkgver}-python.py "$pkgdir/usr/bin/$pkgname"
}
