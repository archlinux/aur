# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
_modulename=texsoup
pkgname=python-$_modulename
pkgver=0.2.0
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
sha256sums=('bb6cc3c598661e8108c6d35b2abc33cf82a0b03b321172cce826ef92b5398b25')
package() {
  cd "$srcdir/TexSoup-$pkgver/"
  python setup.py install --root="$pkgdir/" --optimize=1
}
