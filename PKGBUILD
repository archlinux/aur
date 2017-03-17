#Maintainer: allencch <allencch at hotmail dot com>
pkgname=bioprospector
pkgver=2004
pkgrel=3
pkgdesc="A DNA seqence motif finding programs"
arch=('i686' 'x86_64')
url="http://motif.stanford.edu/distributions/bioprospector/"
license=('custom')
depends=()
source=("http://motif.stanford.edu/distributions/bioprospector/BioProspector.${pkgver}.zip")
md5sums=('a7d889bb10ad0777cea39b9cf0ef8228')

package() {
	mkdir -p "${pkgdir}/usr/bin"
	install -m755 BioProspector.linux "${pkgdir}/usr/bin/BioProspector"
	install -m755 genomebg.linux "${pkgdir}/usr/bin/genomebg"
}
