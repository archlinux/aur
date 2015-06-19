# Contributor: Jonathan Liu <net147@gmaiml.com>
pkgname=pygts
pkgver=0.3.1
pkgrel=2
pkgdesc="Python package used to construct, manipulate, and perform computations on triangulated surfaces"
arch=('i686' 'x86_64')
url="http://pygts.sourceforge.net/"
license=('LGPL')
depends=('gts' 'python-numpy')
optdepends=('python-mayavi: Data visualization')
source=("http://downloads.sourceforge.net/project/${pkgname}/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.gz")
md5sums=('ba8158b57bab354da36a834415936045')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir" -O1
}

# vim:set ts=2 sw=2 et:
