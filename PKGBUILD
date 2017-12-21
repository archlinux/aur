# Maintainer: Clint Valentine <valentine.clint@gmail.com>

pkgname='python-pyensembl'
pkgver=1.1.0
pkgrel=1
pkgdesc="Python interface to ensembl reference genome metadata"
arch=('any')
url="https://github.com/hammerlab/pyensembl"
license=('Apache-2.0')
depends=(
  'python'
  'python-datacache>=0.4.19'
  'python-memoized-property>=1.0.2'
  'python-numpy>=1.7'
  'python-pandas>=0.15'
  'python-serializable>=0.1.1'
  'python-six>=1.9.0'
  'python-tinytimer>=0.0.0'
  'python-typechecks>=0.0.2')
optdepends=()
makedepends=('python-pypandoc' 'python-setuptools')
ptions=(!emptydirs)
source=("https://github.com/hammerlab/pyensembl/archive/v${pkgver}.tar.gz")
md5sums=('1da160b3228bdd3c66479c1122f9e376')

package() {
  cd "${srcdir}/pyensembl-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
