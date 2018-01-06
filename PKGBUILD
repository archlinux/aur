# Maintainer: Clint Valentine <valentine.clint@gmail.com>

pkgname='python-gtfparse'
pkgver=0.0.6
pkgrel=1
pkgdesc="Python library for parsing GTF files"
arch=('any')
url="https://pypi.python.org/pypi/gtfparse"
license=('Apache-2.0')
depends=('python' 'python-numpy>=1.7' 'python-pandas>=0.15')
optdepends=()
makedepends=('python-setuptools')
ptions=(!emptydirs)
source=("https://pypi.python.org/packages/2a/e9/96b187f33a1ce4d31287cda09c3422b3a9439a4245699364e6f4c5bbf5b2/gtfparse-0.0.6.tar.gz")
md5sums=('c20554c039eb512e81bec7a26bfa2c8c')

package() {
  cd "${srcdir}/gtfparse-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
