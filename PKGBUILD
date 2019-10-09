# Maintainer: Tobias Bachmann <tobachmann@gmx.de>
pkgname=python-wxnatpy
pkgver=0.3.2
pkgrel=1
pkgdesc="wxnatpy is a wxPython widget which allows users to browse the contents of a XNAT repository. It is built on top of wxPython and xnatpy."
arch=('any')
_name=wxnatpy
url="https://github.com/pauldmccarthy/wxnatpy"
license=('Apache')
groups=()
depends=('python' 'wxpython' 'python-xnatpy>=0.3.21')
makedepends=()
provides=()
conflicts=()
replaces=('wxnatpy')
backup=()
options=(!emptydirs)
install=
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('252c07d63caaca94beb3a73016a65eb6807d92387b6f396e061bf0408801ac82')

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
