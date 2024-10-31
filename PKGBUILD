# Maintainer: svgaming <svgaming234@gmail.com>

pkgname=cstats
pkgver=0.5.0
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
sha256sums=('4f6ba135db3a7f138df0aa332a290ab6a78257ae655195b896fb5aee9719dd34')

package() {
	install -Dm755 ./cstats.py "$pkgdir/usr/bin/$pkgname"
}
