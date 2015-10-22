# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-humanfriendly
pkgver=1.36
pkgrel=1
pkgdesc="Human friendly output for text interfaces using Python"
arch=('any')
depends=('python2')
makedepends=('python2-setuptools')
url="https://humanfriendly.readthedocs.org"
license=('MIT')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/h/${pkgname#python2-}/${pkgname#python2-}-$pkgver.tar.gz)
md5sums=('b4f4ad3f906b9ff66ac72ba38d479680')
sha256sums=('eabb02c7cd003e5524accb861de38f738a38857b446d3c07ae271ab5fb0857e4')
provides=('humanfriendly' 'python2-humanfriendly')
conflicts=('humanfriendly')

package() {
  cd "$srcdir/${pkgname#python2-}-$pkgver"

  msg2 'Installing...'
  python2 setup.py install --root="$pkgdir" --optimize=1
}
