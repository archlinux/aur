# Maintainer: Tobias Bachmann <tobachmann@gmx.de>
pkgname=python-wxnatpy
pkgver=0.3.0
pkgrel=1
pkgdesc="wxnatpy is a wxPython widget which allows users to browse the contents of a XNAT repository. It is built on top of wxPython and xnatpy."
arch=('any')
_name=wxnatpy
url="https://github.com/pauldmccarthy/wxnatpy"
license=('Apache')
groups=()
depends=('python' 'wxpython' 'python-xnatpy>=0.3.5')
makedepends=()
provides=()
conflicts=()
replaces=('wxnatpy')
backup=()
options=(!emptydirs)
install=
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('a547361fd63dc6c01cae0369b86bb5a8b94c99206704a64822ecc3390a20c2b8')

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
