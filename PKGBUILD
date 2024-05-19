# Maintainer: Gianmarco Gargiulo <me@gianmarco.gg>
pkgname=harmony2
pkgver=2.0.1
pkgrel=1
pkgdesc="Dream Sounds: Harmony 2 sound theme for KDE Plasma"
arch=(any)
url="https://gianmarco.gg/other/harmony2/"
license=('CC-BY-SA-4.0')
optdepends=('plasma-desktop: the desktop this theme was intended for')
source=("https://git.gianmarco.gg/gianmarco/harmony2/releases/download/$pkgver/ds-harmony2-$pkgver.tar.gz")
sha256sums=(c51920987a7e4c0a97dc2973c765a5c493e6e618854a7285d485004406943f19)

package() {
	mkdir -p "$pkgdir/usr/share/sounds/harmony2"
	cd "$srcdir"
	cp -r stereo index.theme "$pkgdir/usr/share/sounds/harmony2"
}
