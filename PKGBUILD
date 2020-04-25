# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
_modulename=texsoup
pkgname=python-$_modulename
pkgver=0.2.1
pkgrel=1
pkgdesc="Python3 package for searching, navigating, and modifying LaTeX documents using BeautifulSoup-esque idioms"
arch=(any)
url="https://github.com/alvinwan/TexSoup"
license=('BSD')
groups=()
depends=()
makedepends=('python-setuptools')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('a42e5e3ecc004a0178edc83f552defb6e75258aaf3be614136a0dfdd6c4e6945')
package() {
  cd "$srcdir/TexSoup-$pkgver/"
  python setup.py install --root="$pkgdir/" --optimize=1
}
