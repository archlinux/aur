# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
_modulename=todoist-python
pkgname=python-$_modulename
pkgver=8.1.1
pkgrel=1
pkgdesc="The official Todoist Python API library"
arch=(any)
url="https://github.com/Doist/$_modulename"
license=('BSD')
groups=()
depends=('python-requests')
makedepends=('python-setuptools')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('009e8a5bb38e496ab7fafdb32e2dd6122f446cb10122da0a4e329c251a5897e9')
package() {
  cd "$srcdir/$_modulename-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
