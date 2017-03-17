# Maintainer: allencch <allencch at hotmail dot com>
pkgname=mdscan
pkgver=2004
pkgrel=3
pkgdesc="A DNA seqence motif finding programs"
arch=('i686' 'x86_64')
url="http://motif.stanford.edu/distributions/mdscan/"
license=('custom')
depends=()
source=("http://motif.stanford.edu/distributions/mdscan/MDscan.${pkgver}.zip")
md5sums=('7326a39c9908a17595a2e02a4af00770')

package() {
	mkdir -p "${pkgdir}/usr/bin"
	install -m755 MDscan.linux "${pkgdir}/usr/bin/MDscan"
}
