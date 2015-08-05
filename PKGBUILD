# Maintainer: Beej Jorgensen <beej@beej.us>
pkgname=phyghtmap
pkgver=1.73
pkgrel=1
pkgdesc="Generate OSM contour lines from NASA SRTM data"
arch=('any')
url="http://katze.tfiu.de/projects/phyghtmap/"
license=('GPL2')
depends=(
  'python2'
  'python2-beautifulsoup3'
  'python2-matplotlib'
  'python2-numpy'
)
makedepends=('python2-setuptools')
options=(!emptydirs)
source=("http://katze.tfiu.de/projects/phyghtmap/phyghtmap_${pkgver}.orig.tar.gz")
sha256sums=('9af022904d5fad66e88d7728b85b0353b1e831c5ca89f760542eb2af5e39bd15')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
