# Maintainer: AlieZ <aaliezz840@gmail.com>
pkgname=ttf-pingfang-git
pkgver=r2.895efd9
pkgrel=1
pkgdesc='PingFang font from Apple.'
url='https://www.apple.com'
arch=('any')
license=('custom')
makedepends=('git')
source=(
	'git+https://github.com/ShmilyHTT/PingFang.git'
)

pkgver() {
	cd PingFang
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	install -d "${pkgdir}/usr/share/fonts/PingFang/"
	install -Dm644 ${srcdir}/PingFang/*.ttf "${pkgdir}/usr/share/fonts/PingFang/"
}

sha256sums=('SKIP')
