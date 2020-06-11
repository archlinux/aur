# Maintainer: Mike Javorski (javmorin) <mike.javorski gmail com>
pkgname=python-chevron
_name=${pkgname#python-}
pkgver=0.13.1
pkgrel=1
pkgdesc='A python implementation of the mustache templating language.'
arch=('any')
url="https://github.com/noahmorrison/chevron"
license=('MIT')
provides=('chevron')
conflicts=('chevron')
depends=('python')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('f95054a8b303268ebf3efd6bdfc8c1b428d3fc92327913b4e236d062ec61c989')

package() {
  cd "$srcdir/$_name-$pkgver"

  /usr/bin/python setup.py install --root="$pkgdir/" --optimize=1
}
