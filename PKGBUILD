# Maintainer: Jonathan Sanfilippo <jonalinux dot uk at gmail dot com>
pkgname=clean
pkgver=1.0
pkgrel=1
pkgdesc="System cleaner"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/architalia/clean"
license=('GPL3')
groups=()
depends=('bash' 'bc')
makedepends=()
checkdepends=()
optdepends=()
source=("git+https://github.com/architalia/$pkgname.git#branch=main" clean)
sha256sums=('SKIP')

package() {
	install -Dm755 clean "$pkgdir/usr/bin/"
}

