# Maintainer: Anton Grensjö <anton@grensjo.se>
pkgname=python-tld
_realname=tld
pkgver=0.9.6
pkgrel=1
pkgdesc="Extracts the top level domain (TLD) from the URL given"
arch=('any')
url="https://github.com/barseghyanartur/tld"
license=('GPL')
depends=('python' 'python-six')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("https://github.com/barseghyanartur/tld/archive/${pkgver}.tar.gz")
sha256sums=('0daea01164b81c2ce0fbd880548b8fe665d3ab92ac877567c1cfca99bbe05dbd')

package() {
  cd "$srcdir/$_realname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
