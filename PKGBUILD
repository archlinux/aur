# Maintainer: lxsh-S <kumarlakshya973@gmail.com>
pkgname='dagit-bin'
pkgver=0.2.0
pkgrel=1
pkgdesc="Visualize your git repo in your terminal!"
arch=('x86_64')
url="https://github.com/lxsh-S/dagit"
license=('MIT')
depends=()
makedepends=()
provides=('dagit')
conflicts=('dagit')

source=("https://github.com/lxsh-S/dagit/releases/download/v${pkgver}/dagit-linux-amd64.tar.gz")
sha256sums=('SKIP')

package() {
  install -Dm755 "$srcdir/dagit-linux-amd64" "$pkgdir/usr/bin/dagit"
}
