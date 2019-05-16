# Maintainer Cookie Engineer <@cookiengineer>

pkgname=bettercap-ui
pkgver=1.3.0
pkgrel=1
pkgdesc="Bettercap Official Web UI"
arch=(any)
url=https://github.com/bettercap/ui
license=("GPL3")
makedepends=("")
source=("https://github.com/bettercap/ui/releases/download/v$pkgver/ui.zip")
sha256sums=("2d3d7e1d7ca920e79107faf512c2f3f5700e0a2becf79eb03f1a629d5efc4a60")

package() {
	mkdir -p "$pkgdir/usr/share/bettercap";
	cp -R "$srcdir/ui" "$pkgdir/usr/share/bettercap/ui";
}
