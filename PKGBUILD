# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-humanfriendly
pkgver=1.43.1
pkgrel=1
pkgdesc="Human friendly output for text interfaces using Python"
arch=('any')
depends=('python2')
makedepends=('python2-setuptools')
url="https://humanfriendly.readthedocs.org"
license=('MIT')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/h/${pkgname#python2-}/${pkgname#python2-}-$pkgver.tar.gz)
md5sums=('f6444416a76c89152ccd8877135e3328')
sha256sums=('f0bb35005ed6d873e62bae51edb7ecbff87b9238f9733d40e83c6cd3dda43c8d')
provides=('humanfriendly' 'python2-humanfriendly')
conflicts=('humanfriendly')

package() {
  cd "$srcdir/${pkgname#python2-}-$pkgver"

  msg2 'Installing...'
  python2 setup.py install --root="$pkgdir" --optimize=1
}
