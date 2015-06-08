# Maintainer: Milo Mirate <mmirate at gmx dot com>
pkgname=python2-pyjavaproperties
_pkgname=pyjavaproperties
pkgver=0.6
pkgrel=3
pkgdesc="Python replacement for java.util.Properties."
arch=('any')
url="https://pypi.python.org/pypi/pyjavaproperties"
license=('PSF')
groups=()
depends=('python2')
makedepends=('python2-setuptools')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://pypi.python.org/packages/source/${pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
md5sums=('e459c21668937a06335e3a2ed77efa22')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
# vim:set ts=2 sw=2 et:

