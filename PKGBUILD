# $Id$
# Maintainer: Grey Christoforo <grey at christoforo dot net>

pkgname=python-cadquery
pkgver=2.0RC1
pkgrel=1
pkgdesc="A parametric CAD scripting framework based on PythonOCC"
arch=('any')
url="https://github.com/CadQuery/cadquery"
license=('Apache')
depends=('python-occ-cadquery-git')
source=("https://github.com/CadQuery/cadquery/archive/${pkgver}.tar.gz")
md5sums=('562d66e73cd8d3f8fa97cfdda8aa1b5d')

package() {
  cd "${srcdir}/cadquery-${pkgver}"
  python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1
}
