# Maintainer: Clint Valentine <valentine.clint@gmail.com>

pkgname=python-gff3
pkgver=0.3.0
pkgrel=1
pkgdesc="Manipulate genomic features and validate the syntax and reference sequence of GFF3 files"
arch=('any')
url="https://github.com/hotdogee/gff3-py"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
provides=('python-gff3')
conflicts=('python-gff3')
options=(!emptydirs)
source=("https://github.com/hotdogee/gff3-py/archive/${pkgver}.tar.gz")
md5sums=('c030f81eb3487fadc94da376f941ee04')

package() {
  cd "${srcdir}/gff3-py-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
