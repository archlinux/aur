# Maintainer: Pieter Goetschalckx <3.14.e.ter <at> gmail <dot> com>

pkgname='python-apa102'
_name=${pkgname#python-}
pkgver=0.0.3
pkgrel=3
pkgdesc="A simple library to drive APA102 pixels from the Raspberry Pi, or similar SBCs."
arch=('any')
url="https://github.com/pimoroni/apa102-python"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')

source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('ae73bdea26f027b57052ab990004ca8faa0f160d10bcacf5bd07e04769513cf9')

package() {
  cd apa102-${pkgver}
  python setup.py install --root="${pkgdir}" --optimize=1
}

# vim:set ts=2 sw=2 et:
