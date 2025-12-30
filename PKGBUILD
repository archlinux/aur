pkgname=stem-splitter-bin
pkgver=1.1.3
pkgrel=1
pkgdesc="AI-powered audio stem separation tool (prebuilt binary)"
arch=('x86_64')
url="https://github.com/gentij/stem-splitter-core"
license=('MIT' 'Apache')
depends=()

# This package provides the "stem-splitter" command
provides=('stem-splitter')
conflicts=('stem-splitter')

source=("stem-splitter-linux-x86_64.tar.gz::https://github.com/gentij/stem-splitter-core/releases/download/v${pkgver}/stem-splitter-linux-x86_64.tar.gz")
sha256sums=('373099e6606c434bd84278251ebf953034f40f5f7dc07c7431873e60b9d79dfe')

package() {
  install -Dm755 "stem-splitter" "$pkgdir/usr/bin/stem-splitter"
}

