# Maintainer: XDwanj <xdwanj@qq.com>
pkgname="noto-fonts-cjk-conf"
pkgver=0.0.1
pkgrel=1
pkgdesc="fix noto-fonts-cjk fallback problem"
arch=(
    'any'
)
url="https://www.google.com/get/noto"
license=('OFL-1.1')
depends=(
	'noto-fonts-cjk'
)
conflicts=(
	"$pkgname"
)
provides=(
	"$pkgname"
)
source=(
	"64-noto-cjk.conf"
)
sha256sums=('357e9ed6553087567ec5a28f835db5c43d3cd68a688e4677f759cca465379a32')

package() {
    cd "$srcdir"
    install -Dm644 "$srcdir/64-noto-cjk.conf" "$pkgdir/etc/fonts/conf.d/64-noto-cjk.conf"
}
