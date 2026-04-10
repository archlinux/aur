# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=millisecond-bin
pkgver=0.2.3
pkgrel=1
pkgdesc="Optimize your Linux system for low latency audio"
arch=('any')
url="https://github.com/gaheldev/Millisecond"
license=('GPL-3.0-or-later')
depends=(gtk4 python-gobject libadwaita glib2 python hicolor-icon-theme dconf)
provides=(${pkgname::-4})
conflicts=(${pkgname::-4})
source=("$url/releases/download/v${pkgver}/${pkgname::-4}_v${pkgver}.deb")
noextract=()
sha256sums=('62607e702e698d43f4133d4ab57549617c705a20ee39a9a1427a361aa0fa9ff9')
validpgpkeys=()

package() {
	cd "$srcdir"
	tar xvf "$srcdir/data.tar.zst" -C "$pkgdir"
}
