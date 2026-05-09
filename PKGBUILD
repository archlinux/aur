# Maintainer: Jacob Meyers <jeyersdev@gmail.com>
pkgname=foxchat
pkgver=2026
pkgrel=5.8
pkggitver=v5.8.2026
pkgdesc="A programming language targeted for building console applications."
arch=('x86_64')
url="https://jd.pnc3.net/software/foxchat"
license=('Apache-2.0')
depends=()
makedepends=('cmake' 'gcc' 'make')
source=("https://github.com/Jacob-Meyers/FoxChat-FOSS/releases/download/$pkggitver/foxchat-gui.tar.gz")
sha256sums=('8b6fc0adf986525be0e7a2140ca3c0485c5c689e635161785d81407bf6594dad')

package() {
    install -Dm755 "$srcdir/foxchat" "$pkgdir/usr/bin/foxchat"
}
