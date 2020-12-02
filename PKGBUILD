# Maintainer: Kevin Azzam <aur@azz.am>
# Contributor: Anton Grensjö <anton@grensjo.se>

pkgname=python-tld
_realname=tld
pkgver=0.12.3
pkgrel=1
pkgdesc="Extracts the top level domain (TLD) from the URL given"
arch=('any')
url="https://github.com/barseghyanartur/tld"
license=('GPL')
depends=('python' 'python-six')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("https://github.com/barseghyanartur/tld/archive/${pkgver}.tar.gz")
sha256sums=('ce45cf94786248d76b39475903d40bdbf72a9c7b4f055e84d2b201a12f55e878')

package() {
  cd "$srcdir/$_realname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
