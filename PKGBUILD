# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
_modulename=py2nb
pkgname=python-$_modulename
pkgver=0.0.2
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
sha256sums=('cfbce248fd5eb5a475c6845fde32aab810ef00d7e23f0ec385c6a76909afaf20')
package() {
  cd "$srcdir/$_modulename-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
