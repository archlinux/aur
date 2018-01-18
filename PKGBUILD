# Maintainer: Clint Valentine <valentine.clint@gmail.com>

pkgname='python-multiqc'
pkgver=1.4
pkgrel=1
pkgdesc="Aggregate bioinformatics analyses results across many samples into a single report"
arch=('any')
url="https://github.com/ewels/MultiQC"
license=('GPL3')
makedepends=('python' 'python-setuptools')
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
source=("${pkgname}"-"${pkgver}".tar.gz::https://pypi.python.org/packages/af/a1/5c5702c4b0ce9ee6fb7d1c982cc6f20832a85bfce184dcb8178f0bdcb5df/multiqc-1.4.tar.gz)
sha256sums=('a83ea64c9a92137a63fc3c6ea37b13af241f9cd9b800eb17d9f03a5d7f261d46')

package() {
  cd "${srcdir}/multiqc-${pkgver}"
  python setup.py install --root="${pkgdir}"/ --optimize=1
}
