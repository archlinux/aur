# Maintainer: Clint Valentine <valentine.clint@gmail.com>

pkgname='python-varcode'
pkgver=0.5.15
pkgrel=1
pkgdesc="Library for manipulating genomic variants and predicting their effects."
arch=('x86_64')
url="https://pypi.python.org/pypi/varcode"
license=('Apache2.0')
depends=(
  'python'
  'python-biopython>=1.64'
  'python-memoized-property>=1.0.2'
  'python-numpy>=1.7'
  'python-numpy<2.0'
  'python-pandas>=0.15'
  'python-pyensembl>=1.0.3'
  'python-pyvcf>=0.6.7'
  'python-sercol>=0.1.0'
  'python-serializable>=0.0.8')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("https://pypi.python.org/packages/3a/f2/088d572940ebe0d1e87aee7e7a79308c8c18391124061c0d8362a56ff1e7/varcode-0.5.15.tar.gz")
md5sums=('2dd5164f11ad90ed9b9c3ac8c03764e1')

package() {
  cd "${srcdir}/varcode-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
