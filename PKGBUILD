# Maintainer: Beej Jorgensen <beej@beej.us>
pkgname=phyghtmap
pkgver=1.80
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
sha256sums=('b0f598fb76138d21e0a396c5d1e4338e110e6727bbdee99e73227a0f44a90ce1')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
