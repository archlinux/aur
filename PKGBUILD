_pkgname=trueskill
pkgname=python-trueskill
pkgver=0.4.4
pkgrel=1
pkgdesc="The video game rating system"
arch=('any')
url="http://trueskill.org/"
license=('BSD')
depends=('python')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/t/trueskill/trueskill-${pkgver}.tar.gz")
md5sums=('fa3e3e51cdaa198225940bc6f8b3e545')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
