# Maintainer: svgaming <svgaming234@gmail.com>

pkgname=cstats
pkgver=0.8.0
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
sha256sums=('40a5d9d0d45754641305325181c3a6b3e7e315550d0cb4c9325308f0585297fb')

package() {
	install -Dm755 ./cstats-v${pkgver}-python.py "$pkgdir/usr/bin/$pkgname"
}
