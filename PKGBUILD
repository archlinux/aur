# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
_modulename=texsoup
pkgname=python-$_modulename
pkgver=0.3.1
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
sha256sums=('3c093e9634675436ff0cfcc9cd116722577613957b11a6285518f51c39a90784')
package() {
  cd "$srcdir/TexSoup-$pkgver/"
  python setup.py install --root="$pkgdir/" --optimize=1
}
