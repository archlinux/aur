# Maintainer: Beej Jorgensen <beej@beej.us>
pkgname=phyghtmap
pkgver=2.20
pkgrel=1
pkgdesc="Generate OSM contour lines from NASA SRTM data"
arch=('any')
url="http://katze.tfiu.de/projects/phyghtmap/"
license=('GPL2')
depends=(
  'python'
  'python-beautifulsoup4'
  'python-matplotlib'
  'python-numpy'
)
makedepends=('python-setuptools')
options=(!emptydirs)
source=("http://katze.tfiu.de/projects/phyghtmap/phyghtmap_${pkgver}.orig.tar.gz")
sha256sums=('cf47cdf00eef12d7059abb4bcef58354bea141a1558ae85ebde7756a57b36162')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
