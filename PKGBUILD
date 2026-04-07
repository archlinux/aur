# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=millisecond-bin
pkgver=0.2.1
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
sha256sums=('b32776504a8e323cff3077ee7dec9ba96ee517a9f5847b929965db13fa20008a')
validpgpkeys=()

package() {
	cd "$srcdir"
	tar xvf "$srcdir/data.tar.zst" -C "$pkgdir"
}
