# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=millisecond-bin
pkgver=0.2.0
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
sha256sums=('719a2ea5f3b868a281f0d039dcd8956f6e5b3c0a2fff45ec292c2466ec3b153b')
validpgpkeys=()

package() {
	cd "$srcdir"
	tar xvf "$srcdir/data.tar.zst" -C "$pkgdir"
}
