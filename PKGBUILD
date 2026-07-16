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

source=("https://github.com/lxsh-S/gos/releases/download/v0.6.5/gos-linux-amd64.tar.gz")
sha256sums=('bb0327a4f232c6bc01845abde45b9a8043988468c768e26ba2071fea2576514d')

package() {
  install -Dm755 "$srcdir/gos-linux-amd64" "$pkgdir/usr/bin/gos"
}
