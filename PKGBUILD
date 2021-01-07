# Maintainer: Beej Jorgensen <beej@beej.us>
pkgname=phyghtmap
pkgver=2.22
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
sha256sums=('d08ad6a423c1fa8b1cd5314a5c4cb4862d810b9a35a0ff8ed44dd401fe2d76fe')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
