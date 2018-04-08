# Maintainer: Caleb Jamison <cbjamo@gmail.com> 
pkgname=python-skidl
pkgver=0.0.20
pkgrel=1
pkgdesc="A Python package for textually describing electronic circuit schematics."
arch=(any)
url="https://xesscorp.github.io/skidl/docs/_site/index.html"
license=('MIT')
groups=()
depends=('python')
optdepends=('kicad-library: part libraries')
provides=()
options=(!emptydirs)
install=
_name=${pkgname#python-}
source=(https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz)
md5sums=(e6ce6d3ecb3122ce516ebcbc9c5a5f27)

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
