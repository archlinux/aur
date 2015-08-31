_pkgname=trueskill
pkgname=python-trueskill
pkgver=0.4.3
pkgrel=1
pkgdesc="The video game rating system"
arch=('any')
url="http://trueskill.org/"
license=('BSD')
depends=('python')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/t/trueskill/trueskill-0.4.3.tar.gz")
md5sums=('a564b45d9fff6eb2932af80b21ad3cec')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
