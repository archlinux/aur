# $Id$
# Maintainer: Grey Christoforo <grey at christoforo dot net>

pkgname=python-cadquery
pkgver=2.0
pkgrel=1
pkgdesc="A parametric CAD scripting framework based on PythonOCC"
arch=('any')
url="https://github.com/CadQuery/cadquery"
license=('Apache')
depends=('python-occ-cadquery-git')
source=("https://github.com/CadQuery/cadquery/archive/${pkgver}.tar.gz")
md5sums=('a63754fdb54ae1dc77c7e20ff5c9d9b0')

package() {
  cd "${srcdir}/cadquery-${pkgver}"
  python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1
}
