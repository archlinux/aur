# Maintainer: Pedro Freitas <pedrosffreitas@gmail.com>

pkgname='ix'
pkgver=1.0
pkgrel=1
pkgdesc="A command line pastebin - shell"
arch=('any')
license=('unknown')
url="http://ix.io"
depends=('curl')
source=("http://ix.io/client")
md5sums=('SKIP')
sha256sums=('SKIP')

package() {
	cd "${pkdgir}"
	mkdir -p ${pkgdir}/usr/bin
	install -m655 client ${pkgdir}/usr/bin/ix 
}
