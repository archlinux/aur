# Maintainer: Sabart Otto - Seberm <seberm[at]seberm[dot]com>

pkgname=ctstream
pkgver=19
pkgrel=1
pkgdesc="Get URLs of Czech Television video streams for specific entry page"
url="http://xpisar.wz.cz/ctstream"
arch=('any')
license=('GPLv3')
depends=('perl' 'perl-libwww' 'perl-xml-xpath' 'perl-json') 
optdepends=()
makedepends=()
conflicts=()
replaces=()
backup=()
source=("http://xpisar.wz.cz/$pkgname/${pkgname}-${pkgver}")

package() {
	cd ${srcdir}
    install -m755 -d ${pkgdir}/usr/bin
    install -m755 "${pkgname}-${pkgver}" "${pkgdir}/usr/bin/${pkgname}"
}

md5sums=('1c54413b5ad5836f39cc9b35f97b09ef')
