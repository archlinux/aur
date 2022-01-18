# Maintainer: Misha <mishakmak@gmail.com>

pkgname=algorand-devtools-bin
pkgver=3.2.3
pkgrel=1
pkgdesc="Development tools for the Algorand blockchain"
arch=('x86_64')
url="https://www.algorand.com"
license=('AGPL3')
depends=("algorand")
provides=("algorand-devtools")
conflicts=("algorand-devtools")
source=("http://algorand-dev-deb-repo.s3-website-us-east-1.amazonaws.com/releases/stable/f9e2a447d_3.2.3/algorand-devtools-3.2.3-1.x86_64.rpm")
sha256sums=('d24f719983c699f177acd90b4d2b1e926620cbdcc6990ae0e2dd74d2c2f2ce60')

package(){
	cd "${srcdir}"
	install -Dm755 usr/bin/* -t "${pkgdir}/usr/bin/"
}
