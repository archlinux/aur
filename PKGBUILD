# Maintainer: Beej Jorgensen <beej@beej.us>
pkgname=phyghtmap
pkgver=2.21
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
sha256sums=('e88a2df3db1bec224f8df1ea5d45bec03ab8d914c734a89ec8cc7666b0c6ba21')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
