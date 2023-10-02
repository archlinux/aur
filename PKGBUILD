# Maintainer: yunshanyao <qimuzi@aliyun.com>
pkgname=otf-macos
pkgver=1.0
pkgrel=1
pkgdesc="package otf-macos running in archlinux kde"
arch=("any")
url="https://github.com/xMuu/arch-kde-fontconfig"
# or url="https://gitee.com/yunshanyao/otf-macos"
license=('custom')
depends=('pacman')
source=(
	"${pkgname}::git+https://${url}.git"		
)
sha256sums=('SKIP')

package() {
	cd ${srcdir}/otf-macos/
	install -Dm644 -t ${pkgdir}/usr/share/fonts/macos/PingFang PingFang/*.ttc
	install -Dm644 -t ${pkgdir}/usr/share/fonts/macos/SF-Mono SF-Mono/*.otf
	install -Dm644 -t ${pkgdir}/usr/share/fonts/macos/SF-Pro SF-Pro/*.otf
	install -Dm644 -t ${pkgdir}/etc/fonts/conf.d/ 64-language-selector-prefer.conf
}
