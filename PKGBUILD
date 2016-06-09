# Maintainer: Your Name <youremail@domain.com>
pkgname=python-geohash
pkgver=0.8.5
pkgrel=1
pkgdesc="Fast, accurate python geohashing library"
arch=('i686' 'x86_64')
url="https://github.com/hkwi/python-geohash"
license=('APACHE')
groups=()
depends=('python')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=('https://pypi.python.org/packages/9c/e2/1a3507af7c8f91f8a4975d651d4aeb6a846dfdf74713954186ade4205850/python-geohash-0.8.5.tar.gz')
md5sums=('b3a787a51f769d881ae20e4d5287a8f2')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  /usr/bin/python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
