# Author: Clayton G. Hobbs <clay@lakeserv.net>

pkgname=kayleevc
pkgver=0.1.1
pkgrel=1
pkgdesc="Somewhat fancy voice command recognition software"
arch=('any')
url="https://github.com/Ratfink/kaylee"
license=(GPL3)
depends=('python' 'pocketsphinx' 'gstreamer' 'gst-plugins-base'
  'python-gobject' 'python-requests')
source=(https://github.com/Ratfink/kaylee/archive/v${pkgver}.tar.gz)
sha256sums=('b3eb487aeced02016ffd66c1d87d3e25224335b0bd111f9708bd43c4b43fb75c')
makedepends=('python')

package() {
  cd "$srcdir/kaylee-$pkgver/"
  python setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
