# Maintainer: zoe <chp321 AT gmail DOT com>

pkgname=crop-pdf
pkgver=0.1
pkgrel=2
pkgdesc="Command line tool to crop PDF files"
arch=('i686' 'x86_64')
license=('GPL')
depends=('bash' 'ghostscript' 'gv')
source=(${pkgname}-${pkgver}.sh)
md5sums=('d74823e8cab57af0aae51c8bfb14b61c')

package() {
	install -D -m755 ${pkgname}-${pkgver}.sh ${pkgdir}/usr/bin/${pkgname}
}
