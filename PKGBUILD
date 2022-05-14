# Maintainer: fordprefect
# Contributor: phijor <mail [at] phijor [dot] me>

pkgname=soundcloud-dl
pkgver=2.7.1
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
source=("$pkgname.tag.gz::https://github.com/flyingrub/scdl/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9a0c29d86f316c196ca293ebecab0b1795176b61b6e6311296bf20a312347e43')

license=(GPL2)

package() {
  cd "$srcdir/scdl-$pkgver"
  python setup.py install --root="$pkgdir"
}
