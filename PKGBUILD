# Maintainer: Clint Valentine <valentine.clint@gmail.com>

pkgname='python-multiqc'
pkgver=1.3
pkgrel=1
pkgdesc="Aggregate results from bioinformatics analyses across many samples into a single report"
arch=('x86_64')
url="https://github.com/ewels/MultiQC"
license=('GPL3')
makedepends=('python-setuptools')
depends=(
  'python'
  'python-click'
  'python-future'
  'python-jinja'
  'python-lzstring'
  'python-markdown'
  'python-matplotlib'
  'python-networkx'
  'python-numpy'
  'python-requests'
  'python-simplejson'
  'python-spectra'
  'python-yaml')
options=(!emptydirs)
source=("https://github.com/ewels/MultiQC/archive/v${pkgver}.tar.gz")
md5sums=('67c4aae8b85ae40fcb2e98319fb629ac')

package() {
  cd "${srcdir}/MultiQC-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
