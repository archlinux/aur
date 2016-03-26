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
sha256sums=('a7f8ff373eedccb255ec7814c15b22c0dd56c42c783e8afe1f24601534d18275')

package() {
	mkdir -p ${pkgdir}/usr/bin
	install -m655 client ${pkgdir}/usr/bin/ix
}
