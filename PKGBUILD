# Maintainer: Tobias Bachmann <tobachmann@gmx.de>
pkgname=python-wxnatpy
pkgver=0.2.3
pkgrel=3
pkgdesc="wxnatpy is a wxPython widget which allows users to browse the contents of a XNAT repository. It is built on top of wxPython and xnatpy."
arch=('any')
_name=wxnatpy
url="https://github.com/pauldmccarthy/wxnatpy"
license=('Apache')
groups=()
depends=('python' 'wxpython' 'python-xnatpy>=0.3.4')
makedepends=()
provides=()
conflicts=()
replaces=('wxnatpy')
backup=()
options=(!emptydirs)
install=
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('a04da5faa560d8fb982999fc71f225430d50bf74aa54da58b8d081d4b04ade8a')

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
