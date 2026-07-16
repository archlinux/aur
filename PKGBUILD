# Maintainer: lxsh-S <kumarlakshya973@gmail.com>
pkgname='gos-bin'
pkgver=0.6.5
pkgrel=1
pkgdesc="A simple CLI tool that can be used to make project structures!"
arch=('x86_64')
url="https://github.com/lxsh-S/gos"
license=('MIT')
depends=()
makedepends=()
provides=('gos')
conflicts=('gos')

source=("https://github.com/lxsh-S/gos/releases/tag/v${pkgver}/gos-linux-amd64.tar.gz")
sha256sums=('ca75e4dfa4efb65a6ee4c776bf3d231f85886eacc96d0ac3ef6408fdb61a0897')

package() {
  install -Dm755 "$srcdir/gos-linux-amd64" "$pkgdir/usr/bin/gos"
}
