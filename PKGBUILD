# Maintainer: William Brown <glowinthedarkcia@horsefucker.org>
pkgname="lwjgl"
pkgver="3.2.3"
pkgrel="1"
arch=("any")
pkgdesc="Java library that enables access to OpenGL, OpenAL, Vulkan, and more."
url="https://github.com/LWJGL/lwjgl3#readme"
source=("https://github.com/LWJGL/lwjgl3/releases/download/$pkgver/$pkgname-$pkgver.zip")
md5sums=("41becadd1b9208785646e04186397e8c")
options=("!strip")
license=("BSD")
depends=("java-environment")
package() {
	cd "$srcdir"
	mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
	cp LICENSE "$pkgdir/usr/share/licenses/$pkgname"
	mkdir "$pkgdir/usr/share/$pkgname"
	cp -R * "$pkgdir/usr/share/$pkgname"
	rm -f "$pkgdir/usr/share/$pkgname/$pkgname-$pkgver.zip"
	unset pkgnamedir
}
