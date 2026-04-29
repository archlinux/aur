# Maintainer: Chair <sergeyponomorev0@gmail.com>
pkgname=hashreaper
pkgver=3.52
pkgrel=2
pkgdesc="Fast hash cracker with network distribution, Russian charsets, and cross-platform"
arch=('x86_64' 'aarch64')
url="https://github.com/xZxZxPussyslayer228xZxZx/HashReaper"
license=('GPL3')
depends=('openssl')
makedepends=('gcc' 'make')
optdepends=('nmap: faster network scan' 'traceroute: automatic network detection')
source=("https://github.com/xZxZxPussyslayer228xZxZx/HashReaper/archive/Stable.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$srcdir/HashReaper-Stable"
  make
}

package() {
  cd "$srcdir/HashReaper-Stable"
  make install DESTDIR="$pkgdir" PREFIX="/usr"
}