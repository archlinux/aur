pkgname=soundcloud-dl
pkgver=2.4.0
pkgrel=2
pkgdesc="Souncloud music downloader"
url="https://github.com/flyingrub/scdl"
arch=(any)
depends=(
  'python-clint'
  'python-docopt'
  'python-mutagen'
  'python-termcolor'
  'python-requests'
  'python-pathvalidate'
  'python-soundcloud-v2'
)
makedepends=(git python-setuptools)
source=("$pkgname.tag.gz::https://github.com/flyingrub/scdl/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('cf7bbdd3a7f0ceafeaa4f5c5fc2f7a72b30ab6db81fa5f4b70ec9a0fe4ff3928')

license=(GPL2)

package() {
  cd "$srcdir/scdl-$pkgver"
  python setup.py install --root="$pkgdir"
}
