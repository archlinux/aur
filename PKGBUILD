# Maintainer: Your Name <youremail@domain.com>
pkgname=python-geohash
pkgver=1.0
pkgrel=3
pkgdesc="Fast, accurate python geohashing library"
arch=('any')
url="https://github.com/hkwi/python-geohash"
license=('APACHE')
groups=()
depends=('python' 'python-docutils')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=('https://pypi.python.org/packages/74/84/fa80c5e92854c7456b591f6e797c5be18315994afd3ef16a58694e1b5eb1/Geohash-1.0.tar.gz')
md5sums=('a7c4e57874061fae1e30dd8aa8b9b390')

package() {
  cd "$srcdir/Geohash-$pkgver"
  /usr/bin/python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
