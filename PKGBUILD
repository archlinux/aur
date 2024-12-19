# Maintainer: svgaming <svgaming234@gmail.com>

pkgname=cstats
pkgver=0.6.0
pkgrel=1
pkgdesc="Command-line RetroMC statistics tool"
arch=(any)
url="https://github.com/svgaming234/cstats"
license=('MIT')
depends=(
	'python'
	'python-requests'
)
source=("https://github.com/svgaming234/cstats/releases/download/v${pkgver}/cstats.py")
sha256sums=('36751bd9516a1e39a8f2efa5426a8f8534489e34905092794de8989289c54955')

package() {
	install -Dm755 ./cstats.py "$pkgdir/usr/bin/$pkgname"
}
