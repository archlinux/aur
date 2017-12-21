# Maintainer: Clint Valentine <valentine.clint@gmail.com>

pkgname='python-serializable'
pkgver=0.1.1
pkgrel=1
pkgdesc="Base class with serialization helpers for user-defined Python objects"
arch=('any')
url="https://pypi.python.org/pypi/serializable"
license=('Apache-2.0')
depends=(
  'python'
  'python-simplejson'
  'python-six>=1.9.0'
  'python-typechecks>=0.0.2')
optdepends=()
makedepends=('python-setuptools')
ptions=(!emptydirs)
source=("https://pypi.python.org/packages/1a/8c/140c24214f503366c80cf9d42c474df2696ea5291bdd318c24d014a859db/serializable-${pkgver}.tar.gz")
md5sums=('dfb019409549f16cfdf7f9496d01a7b9')

package() {
  cd "${srcdir}/serializable-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
