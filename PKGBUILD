# Maintainer: Milo Mirate <mmirate at gmx dot com>
pkgname=python2-pyjavaproperties
_pkgname=pyjavaproperties
pkgver=0.7
pkgrel=1
pkgdesc="Python replacement for java.util.Properties."
arch=('any')
url="https://pypi.python.org/pypi/pyjavaproperties"
license=('MIT')
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
md5sums=('c8382eb5f6565b8ebca7b874f1b90d69')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
