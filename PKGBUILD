# Maintainer: svgaming <svgaming234@gmail.com>

pkgname=cstats
pkgver=0.10.0
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
sha256sums=('f01f9a1e3d4f21c8bc9f09f09b06909615caa98218ddfdcb798518438802674b')

package() {
	install -Dm755 ./cstats-v${pkgver}-python.py "$pkgdir/usr/bin/$pkgname"
}
