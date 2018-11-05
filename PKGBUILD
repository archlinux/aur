# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
_modulename=py2nb
pkgname=python-$_modulename
pkgver=0.0.1
pkgrel=1
pkgdesc="Convert python scripts to jupyter notebooks"
arch=(any)
url="https://github.com/williamjameshandley/${_modulename}"
license=('GPL')
groups=()
depends=('jupyter-notebook')
makedepends=('python-setuptools')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('aa1263428703c261c1259e0ec937b83d4e090a387b2edfd3e6e6adc36c4fef0d')
package() {
  cd "$srcdir/$_modulename-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
