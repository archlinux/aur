# Maintainer: Kevin Azzam <aur@azz.am>
# Contributor: Anton Grensjö <anton@grensjo.se>

pkgname=python-tld
_realname=tld
pkgver=0.12
pkgrel=1
pkgdesc="Extracts the top level domain (TLD) from the URL given"
arch=('any')
url="https://github.com/barseghyanartur/tld"
license=('GPL')
depends=('python' 'python-six')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("https://github.com/barseghyanartur/tld/archive/${pkgver}.tar.gz")
sha256sums=('385e3d2d8c0eda0a5e626e28ac0d14f4c9f7729a6a6c21881ba838ba58f45073')

package() {
  cd "$srcdir/$_realname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
