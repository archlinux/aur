# Maintainer: nathawat <nathawat[at]noreply[dot]codeberg[dot]org>

pkgname=uutils-findutils-shim
pkgver=1.0.0
pkgrel=1
pkgdesc="Replaces GNU findutils with uutils findutils"
arch=('any')
url="https://uutils.github.io/findutils/"
license=('MIT')
depends=('uutils-findutils')
provides=('findutils')
conflicts=('findutils')

package() {
	mkdir -p "$pkgdir/usr/bin"

	ln -s uu-find "$pkgdir/usr/bin/find"
	ln -s uu-xargs "$pkgdir/usr/bin/xargs"
}
