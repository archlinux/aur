# Maintainer: chen-197 <1979273790@qq.com>
pkgname=com.qianxin.browser-stable
pkgver=1.0.32574.3_1
pkgrel=1
epoch=
pkgdesc="奇安信可信浏览器"
arch=('x86_64')
url="https://www.qianxin.com/"
license=('custom')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://home-store-img.uniontech.com/apppkg/4126711d-9e85-4da1-a611-991d0583a2d7")
noextract=("4126711d-9e85-4da1-a611-991d0583a2d7")
md5sums=('f40f611792cdbbfdd8eb5d4d2fdc083f')
validpgpkeys=()

prepare() {
	mv 4126711d-9e85-4da1-a611-991d0583a2d7  com.qianxin.browser-stable_1.0.32574.3-1_amd64.deb
	ar -x com.qianxin.browser-stable_1.0.32574.3-1_amd64.deb
	mkdir  com.qianxin.browser-stable_1.0.32574.3-1
	tar -xf data.tar.xz --directory="com.qianxin.browser-stable_1.0.32574.3-1"
}



package() {
	cd "com.qianxin.browser-stable_1.0.32574.3-1"
	mkdir -p ${pkgdir}/opt/apps/
	mkdir -p ${pkgdir}/usr/share/applications/
	mkdir -p ${pkgdir}/usr/share/icons/
	cp -a  ${srcdir}/com.qianxin.browser-stable_1.0.32574.3-1/opt/apps/com.qianxin.browser-stable  ${pkgdir}/opt/apps/
	cp -a ${srcdir}/com.qianxin.browser-stable_1.0.32574.3-1/opt/apps/com.qianxin.browser-stable/entries/applications/com.qianxin.browser-stable.desktop  ${pkgdir}/usr/share/applications/
	chmod 644 ${pkgdir}/usr/share/applications/com.qianxin.browser-stable.desktop
	cp -a ${srcdir}/com.qianxin.browser-stable_1.0.32574.3-1/opt/apps/com.qianxin.browser-stable/entries/icons/hicolor   ${pkgdir}/usr/share/icons/
}
