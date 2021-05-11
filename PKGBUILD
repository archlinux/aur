# Maintainer: Mike Javorski (javmorin) <mike.javorski gmail com>
pkgname=python-chevron
_name=${pkgname#python-}
pkgver=0.14.0
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
sha256sums=('87613aafdf6d77b6a90ff073165a61ae5086e21ad49057aa0e53681601800ebf')

package() {
  cd "$srcdir/$_name-$pkgver"

  /usr/bin/python setup.py install --root="$pkgdir/" --optimize=1
}
