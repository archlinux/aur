# Maintainer: Mykhailo Aleksieiev <mishanya.bigimot@gmail.com>
pkgname=gogofetch-bin
pkgver=1.0.10
pkgrel=1
pkgdesc="Fetch written in Go with image support (pre-compiled binary)"
arch=('x86_64')
url="https://codeberg.org/nekohepott/goGoFetch"
license=('MIT')
depends=('glibc' 'chafa')
provides=("gogofetch")
conflicts=("gogofetch")
source=("https://codeberg.org/nekohepott/goGoFetch/releases/download/v1.0.10/gogofetch-v1.0.10-linux-amd64.tar.gz")
sha256sums=('8012992bcde01cdb3bd4b0eb4e7b5f242c72aafe771b8062c2c0aef8e3ff1fc1')

package() {
  cd "$srcdir"
  make DESTDIR="$pkgdir" PREFIX="/usr" install
}
