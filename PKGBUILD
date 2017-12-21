# Maintainer: Clint Valentine <valentine.clint@gmail.com>

pkgname='python-gffutils'
pkgver=0.9
pkgrel=1
pkgdesc="GFF and GTF file manipulation and interconversion"
arch=('any')
url="https://github.com/daler/gffutils"
license=('MIT')
depends=(
  'python'
  'python-argcomplete'
  'python-argh'
  'python-pyfaidx'
  'python-simplejson'
  'python-six')
optdepends=(
  'python-biopython: for sequence manipulation'
  'bedtools: for genomic interval arithemtic'
  'python-pybedtools: wrapper for bedtools')
makedepends=('python-setuptools')
ptions=(!emptydirs)
source=("https://github.com/daler/gffutils/archive/v${pkgver}.tar.gz")
md5sums=('819e44d2995175d6b0e575ecf07fc50f')

package() {
  cd "${srcdir}/gffutils-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
