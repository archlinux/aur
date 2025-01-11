# Maintainer: svgaming <svgaming234@gmail.com>

pkgname=cstats
pkgver=0.6.1
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
sha256sums=('0cafac9e7001e9e3f388d15527eb75d90b7b8f919f037ba312203e988ef0a75d')

package() {
	install -Dm755 ./cstats-v${pkgver}-python.py "$pkgdir/usr/bin/$pkgname"
}
