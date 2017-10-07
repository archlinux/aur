# Maintainer: David Mehren <david.mehren@udo.edu>
pkgname=python2-pdftools
pkgver=0.37
pkgrel=1
pkgdesc='Basic classes for handling information in PDF files.'
arch=('any')
url='http://www.boddie.org.uk/david/Projects/Python/pdftools/'
license=('GPL2')
depends=('python2')
makedepends=()
source=("http://www.boddie.org.uk/david/Projects/Python/pdftools/Software/pdftools-${pkgver}.tar.gz")
sha256sums=('634cb50bcd276dda5ab39e3602acfb0370694b61b70eb357201f2bd40240ab4e')

package() {
	cd "${srcdir}/pdftools-${pkgver}"
	python2 setup.py install --root="${pkgdir}/" --optimize=1
}
