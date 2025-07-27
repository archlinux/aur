# Maintainer: svgaming <svgaming234@gmail.com>

pkgname=cstats
pkgver=0.9.0
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
sha256sums=('0d04ddba182bc61a4745d3a84d73eba42a12bb36076a8a91f5917c5f16aaa8ff')

package() {
	install -Dm755 ./cstats-v${pkgver}-python.py "$pkgdir/usr/bin/$pkgname"
}
