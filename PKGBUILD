# Maintainer: Anton Grensjö <anton@grensjo.se>
pkgname=python-tld
_realname=tld
pkgver=0.10
pkgrel=1
pkgdesc="Extracts the top level domain (TLD) from the URL given"
arch=('any')
url="https://github.com/barseghyanartur/tld"
license=('GPL')
depends=('python' 'python-six')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("https://github.com/barseghyanartur/tld/archive/${pkgver}.tar.gz")
sha256sums=('800cdd8350b94c883fe88f09780ec86b5a9b09964b5256ee33cd95bf0b0622a4')

package() {
  cd "$srcdir/$_realname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
