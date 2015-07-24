# Maintainer: Faule Socke <github@socker.lepus.uberspace.de>
_pkgname=flipflop
pkgname=python-$_pkgname
pkgver=1.0
pkgrel=1
pkgdesc="A python FastCGI wrapper for WSGI applications"
arch=(any)
url="https://github.com/Kozea/flipflop"
license=('BSD')
groups=()
depends=('python')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=(https://pypi.python.org/packages/source/f/flipflop/flipflop-1.0.tar.gz)
md5sums=('9c129c4ef7b269a73113410b640edadd')
sha256sums=('32a23ed7bdb53bab03271c4c92abceae1ee3a337dd7fd5a18334fd64930ebcfd')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
