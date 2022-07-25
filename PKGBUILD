pkgname=ttf-pingfang-git
pkgver=r2.895efd9
pkgrel=1
pkgdesc='PingFang font from Apple.'
url='https://www.apple.com'
arch=('x86_64')
license=('custom')
source=(
'git+https://github.com/ShmilyHTT/PingFang.git'
)

package() {
	install -d "${pkgdir}/usr/share/fonts/PingFang/"
	install -Dm644 ${srcdir}/PingFang/*.ttf "${pkgdir}/usr/share/fonts/PingFang/"
}

sha256sums=('SKIP')
