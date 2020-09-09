# Maintainer: Your Name <kyli0x@protonmail.ch>

pkgname=kurcoder-git
pkgver=0.0.1
pkgrel=1
pkgdesc="Toolkit for encoding, decoding, checksums, hex conversions & IP calculations"
arch=('any')
url="https://github.com/0xkurome/kurcoder.git"
license=('MIT')
depends=('python3' 'python-pip')
makedepends=('git' 'python-setuptools')
source=("git+$url")
md5sums=('SKIP')


package() {
  cd "kurcoder"
  make DESTDIR="$pkgdir/" install
}
