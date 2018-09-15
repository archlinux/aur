# Maintainer: Tobias Bachmann <tobachmann@gmx.de>
pkgname=python-wxnatpy
pkgver=0.3.1
pkgrel=2
pkgdesc="wxnatpy is a wxPython widget which allows users to browse the contents of a XNAT repository. It is built on top of wxPython and xnatpy."
arch=('any')
_name=wxnatpy
url="https://github.com/pauldmccarthy/wxnatpy"
license=('Apache')
groups=()
depends=('python' 'wxpython' 'python-xnatpy>=0.3.9')
makedepends=()
provides=()
conflicts=()
replaces=('wxnatpy')
backup=()
options=(!emptydirs)
install=
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('130b4b39299e213c4cf6829b64c03d2e0e3ba6b234a8d5f2044d7b4cb572c5f4')

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
