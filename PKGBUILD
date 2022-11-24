# Maintainer: fordprefect
# Contributor: phijor <mail [at] phijor [dot] me>

pkgname=soundcloud-dl
pkgver=2.7.3
pkgrel=1
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
source=("$pkgname-$pkgver.tag.gz::https://github.com/flyingrub/scdl/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e05cc7983369e6635e43eff3c9036f8707d7315db2076dc8d9046bf16f1c020d')

license=(GPL2)

package() {
  cd "$srcdir/scdl-$pkgver"
  python setup.py install --root="$pkgdir"
}
