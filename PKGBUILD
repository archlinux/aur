# Maintainer: Mykhailo Aleksieiev <mishanya.bigimot@gmail.com>
pkgname=gogofetch-bin
pkgver=1.0.11
pkgrel=1
pkgdesc="Fetch written in Go with image support (pre-compiled binary)"
arch=('x86_64')
url="https://codeberg.org/nekohepott/goGoFetch"
license=('MIT')
depends=('glibc' 'chafa')
provides=("gogofetch")
conflicts=("gogofetch")
source=("https://codeberg.org/nekohepott/goGoFetch/releases/download/v1.0.11/gogofetch-v1.0.11-linux-amd64.tar.gz")
sha256sums=('20eb56e934bfc6dc7214352c962b9e7cc4270302e37f440d36f26bcfacf639b1')

package() {
  cd "$srcdir"
  make DESTDIR="$pkgdir" PREFIX="/usr" install
}
