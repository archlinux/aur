# Maintainer: Aidan Williams <ppeb at ppeb dot me>
# Contributor: William Brown <glowinthedarkcia@horsefucker.org>
pkgname="lwjgl"
pkgver="3.3.3"
pkgrel="1"
arch=("any")
pkgdesc="Java library that enables access to OpenGL, OpenAL, Vulkan, and more."
url="https://github.com/LWJGL/lwjgl3"
source=("https://github.com/LWJGL/lwjgl3/releases/download/$pkgver/$pkgname.zip")
md5sums=("88847a8b89b3edf82c48c8baa33b7e23")
options=("!strip")
license=("BSD")
depends=("java-environment")
package() {
	cd "$srcdir"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	mkdir "$pkgdir/usr/share/$pkgname"
	cp -R * "$pkgdir/usr/share/$pkgname"
	rm -f "$pkgdir/usr/share/$pkgname/$pkgname-$pkgver.zip"
}
