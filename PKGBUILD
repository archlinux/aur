# Maintainer: Donald Webster <fryfrog@gmail.com>
# Contributor: sleduc <sebastien@sleduc.fr>
# Contributor: Quentin Stievenart <acieroid@awesom.eu>

pkgname=python2-babelfish
pkgver=0.5.5
pkgrel=1
pkgdesc="A module to work with countries and languages"
arch=('any')
url="http://pypi.python.org/pypi/babelfish"
license=('BSD')
makedepends=('python2-setuptools')
depends=('python2')
options=(!emptydirs)

source=("https://pypi.python.org/packages/source/b/babelfish/babelfish-$pkgver.tar.gz")
sha512sums=('71504dd0203ad85a6a69107d67df3bd5ae4193515e74c05b346a8bd0aab425fc1534d54d1c74b14e48580ee5e76f04705e35c2d359fbe46254bee37e41cb4bfa')

package() {
  cd "$srcdir/babelfish-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
