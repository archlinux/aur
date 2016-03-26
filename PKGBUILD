# Maintainer: Pedro Freitas <pedrosffreitas@gmail.com>

pkgname='ix'
pkgver=1.0
pkgrel=1
pkgdesc="A command line pastebin - shell"
arch=('any')
license=('unknown')
url="http://ix.io" 
depends=('curl')
makedepends=('git')
source=("${pkgname}::git://github.com/PedroSFreitas/ix-client.git")
md5sums=('SKIP')
sha256sums=('SKIP')

package() {
	cd "${srcdir}/${pkgname}"
	mkdir -p ${pkgdir}/usr/bin
	install -m755 ix ${pkgdir}/usr/bin
}
