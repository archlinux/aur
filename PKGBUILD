# Maintainer: patrickelectric <patrickelectric {a.t} gmail {d.o.t} com>
pkgname=python-common
pkgver=0.1.2
pkgrel=1
pkgdesc="Common tools and data structures implemented in pure python."
arch=('any')
url="https://pypi.python.org/pypi/common"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
provides=('python-common')
source=('https://pypi.python.org/packages/eb/b2/c900168d36abd28b1b08a81387835eff8b574bc6c2e9fefb5c4a38135d94/common-0.1.2.tar.gz')
md5sums=('a3fc474353300d0e1f60c21aca7dd47f')

package() {
  cd "$srcdir/common-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
md5sums=('a3fc474353300d0e1f60c21aca7dd47f')
