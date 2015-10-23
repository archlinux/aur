# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-humanfriendly
pkgver=1.42
pkgrel=1
pkgdesc="Human friendly output for text interfaces using Python"
arch=('any')
depends=('python2')
makedepends=('python2-setuptools')
url="https://humanfriendly.readthedocs.org"
license=('MIT')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/h/${pkgname#python2-}/${pkgname#python2-}-$pkgver.tar.gz)
md5sums=('23250a4d0b871915642d89df137b3c2f')
sha256sums=('e64417fd2b7e9b1fa0c2264e03a289734c2c7692030059fc4d3a0440b1e87da3')
provides=('humanfriendly' 'python2-humanfriendly')
conflicts=('humanfriendly')

package() {
  cd "$srcdir/${pkgname#python2-}-$pkgver"

  msg2 'Installing...'
  python2 setup.py install --root="$pkgdir" --optimize=1
}
