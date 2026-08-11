# Maintainer:
pkgname=plasma-splash-catppuccin-mocha
pkgver=0.4.0
pkgrel=1
pkgdesc="Soothing pastel splash screens for KDE Plasma - Mocha"
arch=(any)
url="https://github.com/catppuccin/kde"
license=('MIT')
depends=('plasma-desktop')
source=("Catppuccin-Mocha-Splash-$pkgver.tar.gz::$url/releases/download/v$pkgver/Catppuccin-Mocha-Splash.tar.gz")
sha256sums=("88c45541f59688c00ed8a2d34cfdebc10e7ac7ddcab4b43891ab1609a26400a5")

package() {
	mkdir -p "$pkgdir/usr/share/plasma/look-and-feel"
	cp -a "$srcdir/Catppuccin-Mocha-Splash/." "$pkgdir/usr/share/plasma/look-and-feel"
}
