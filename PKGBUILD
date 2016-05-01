# Author: Clayton G. Hobbs <clay@lakeserv.net>

pkgname=kayleevc
pkgver=0.1.0
pkgrel=1
pkgdesc="Somewhat fancy voice command recognition software"
arch=('any')
url="https://github.com/Ratfink/kaylee"
license=(GPL3)
depends=('python' 'pocketsphinx' 'gstreamer' 'gst-plugins-base'
  'python-gobject' 'python-requests')
source=(https://github.com/Ratfink/kaylee/archive/v0.1.0.tar.gz)
sha256sums=('698ca55c787a021181c9ee1171b6fd906d7134d17bd25a3d0204c28ad9bd550a')
makedepends=('python')

package() {
  cd "$srcdir/kaylee-$pkgver/"
  python setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
