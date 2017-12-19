# Maintainer: Clint Valentine <valentine.clint@gmail.com>

pkgname='python-lzstring'
pkgver=1.0.3
pkgrel=1
pkgdesc="LZ-string compression for Python"
arch=('x86_64')
url="https://pypi.python.org/pypi/lzstring/"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
provides=('python-lzstring')
conflicts=('python-lzstring')
options=(!emptydirs)
source=("https://pypi.python.org/packages/2b/e0/06231b1114cae946b6d3505ab8157f7308b207e3f8e3eb58334769dab6c0/lzstring-${pkgver}.tar.gz")
md5sums=('1c636543484629020a26432740f81443')

package() {
  cd "${srcdir}/lzstring-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
