# Maintainer: Clint Valentine <valentine.clint@gmail.com>

pkgname='python-pygeno'
pkgver=1.3.1
pkgrel=1
pkgdesc="A Python package for precision medicine and proteogenomics."
arch=('any')
url="https://github.com/tariqdaouda/pyGeno"
license=('Apache2')
depends=('python' 'python-radadb')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("https://github.com/tariqdaouda/pyGeno/archive/${pkgver}.tar.gz")
md5sums=('4a92d0381abfa708762d9eb586019caf')

package() {
  cd "${srcdir}/pyGeno-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}
