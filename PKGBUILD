# Maintainer: Jacob Meyers <jeyersdev@gmail.com>
pkgname=foxchat-cli
pkgver=2026
pkgrel=5.8
pkggitver=v5.8.2026
pkgdesc="A programming language targeted for building console applications."
arch=('x86_64')
url="https://jd.pnc3.net/software/foxchat"
license=('Apache-2.0')
depends=()
makedepends=('cmake' 'gcc' 'make')
source=("https://github.com/Jacob-Meyers/FoxChat-FOSS/releases/download/$pkggitver/foxchat-cli.tar.gz")
sha256sums=('a0b762922944044076fe94d3bc82743efa11f17c7199235991a3bb7836283500')

package() {
    install -Dm755 "$srcdir/foxchat-cli" "$pkgdir/usr/bin/foxchat-cli"
}
