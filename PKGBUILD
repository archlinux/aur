# Maintainers: kobe-koto <admin[at]koto.cc>, Ketal_Q_ray<k@ketal.icu>
pkgname="liteloader-qqnt-bin"
_pkgname="LiteLoaderQQNT"
pkgver=0.3.1
pkgrel=8
pkgdesc="轻量, 简洁, 开源的 QQNT 插件加载器"
arch=('any')
url="https://github.com/mo-jinran/LiteLoaderQQNT"
license=('MIT')
depends=("linuxqq")
conflicts=("linuxqq-appimage" "liteloader-qqnt")
provides=("liteloader-qqnt")
install=${pkgname}.install
source=("${url}/archive/refs/tags/${pkgver}.tar.gz")
md5sums=('SKIP')

package() {
	mkdir -p "${pkgdir}/opt/QQ/resources/app"
	mv "${_pkgname}-${pkgver}" "${pkgdir}/opt/QQ/resources/app/LiteLoader"

	echo "======== TIPS ========"
	echo "If you reinstall/install/upgrade linuxqq after installing this package, "
	echo "you may need to reinstall this package to make LiteLoaderQQNT works."
	echo "======== TIPS ========"
}
