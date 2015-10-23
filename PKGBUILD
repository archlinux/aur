# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-humanfriendly
pkgver=1.41
pkgrel=1
pkgdesc="Human friendly output for text interfaces using Python"
arch=('any')
depends=('python2')
makedepends=('python2-setuptools')
url="https://humanfriendly.readthedocs.org"
license=('MIT')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/h/${pkgname#python2-}/${pkgname#python2-}-$pkgver.tar.gz)
md5sums=('790ceb288dd487729cda163322cedd5c')
sha256sums=('8e226d69f9d9f22970bb0e87b0c13e95c5f72c8141258782023b37a4d7d0ba74')
provides=('humanfriendly' 'python2-humanfriendly')
conflicts=('humanfriendly')

package() {
  cd "$srcdir/${pkgname#python2-}-$pkgver"

  msg2 'Installing...'
  python2 setup.py install --root="$pkgdir" --optimize=1
}
