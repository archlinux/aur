# Maintainer: Tobias Bachmann <tobachmann@gmx.de>
pkgname=python-wxnatpy
pkgver=0.2.2
pkgrel=3
pkgdesc="wxnatpy is a wxPython widget which allows users to browse the contents of a XNAT repository. It is built on top of wxPython and xnatpy."
arch=('any')
_name=wxnatpy
url="https://github.com/pauldmccarthy/wxnatpy"
license=('Apache')
groups=()
depends=('python' 'wxpython' 'python-xnatpy')
makedepends=()
provides=()
conflicts=()
replaces=('wxnatpy')
backup=()
options=(!emptydirs)
install=
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('3ad354afda48b5bfb0924d28072c313b525f0047709b690e5083ed9b5175aa38')

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
