# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=dash-core-components
_pkgname=dash_core_components
pkgver=0.5.3
pkgrel=1
pkgdesc="A dash components starter pack."
arch=('any')
url="https://plot.ly/dash/dash-core-components"
license=('MIT')
depends=('python')
optdepends=()
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/70/79/8785f5e7341a711e37741f6ee4cde674ab3725e69ffd3d3a20fc5315b6dd/dash_core_components-${pkgver}rc1.tar.gz")
sha256sums=('SKIP')

package(){
  cd "${srcdir}/${_pkgname}-${pkgver}rc1"
  python setup.py install --root="$pkgdir/" --optimize=1
}

#check(){
#  cd "$srcdir/$pkgname"
#  python -m unittest
#}
# vim:ts=2:sw=2:et:
