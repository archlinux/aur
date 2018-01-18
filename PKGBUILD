# Maintainer: kpcyrd <git@rxv.cc>

_pyname="mt940"
pkgname="python-mt940"
pkgver="0.4"
pkgrel=1
pkgdesc="A module to parse MT940 files"
arch=(any)
url="https://pypi.python.org/pypi/mt940"
license=('BSD')
makedepends=('python-setuptools')
source=(${pkgname}-${pkgver}.tar.gz::https://pypi.python.org/packages/ea/ab/a66a9e8422901f8bdd227f34a9d6ecd49ab81dd3defe1080e18204762df8/mt940-0.4.tar.gz)
md5sums=('31d8b0136d9f4891c91e3af0f4eb9002')
sha512sums=('3aca8529fcae904bd69dc667a30ab9e978226d5b823edb6acb72d1c79a4ca4278470195843b055ed66b94f3333e123ea6945b8aa6b66934a5c92cfa241cad9bb')

build() {
  cd "$_pyname-$pkgver"
  python setup.py build
}

package() {
  cd "$_pyname-$pkgver"
  python setup.py install -O1 --root="${pkgdir}"
}

# vim:set ts=2 sw=2 et:
