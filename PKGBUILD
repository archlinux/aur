# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
_modulename=py2nb
pkgname=python-$_modulename
pkgver=0.0.4
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
sha256sums=('b30543209849967b9c49ed912005ab7176f30eb7f5e6bbf7387be6b64f4f54ef')
package() {
  cd "$srcdir/$_modulename-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
