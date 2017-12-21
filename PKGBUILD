# Maintainer: Clint Valentine <valentine.clint@gmail.com>

pkgname='python-pyentrezid'
pkgver=1.4.9
pkgrel=1
pkgdesc="Converts Ensembl, Uniprot, and HGNC IDs to Entrez Gene Id"
arch=('any')
url="https://github.com/lwgray/pyEntrezId"
license=('MIT')
depends=(
  'python'
  'python-colorama>=0.3.7'
  'python-nose>=1.3.7'
  'python-pygments>=2.1.3'
  'python-rednose>=1.1.1'
  'python-termstyle>=0.1.10'
  'python-requests>=2.10.0'
  'python-xmltodict>=0.10.1'
)
makedepends=('python-setuptools')
rovides=('python-pyentrezid')
conflicts=('python-pyentrezid')
options=(!emptydirs)
source=("git+https://github.com/lwgray/pyEntrezId.git")
md5sums=('SKIP')

package() {
  cd "${srcdir}/pyEntrezId"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
