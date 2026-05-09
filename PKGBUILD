# Maintainer: Jacob Meyers <jeyersdev@gmail.com>
pkgname=foxchat-server
pkgver=2026
pkgrel=5.8
pkggitver=v5.8.2026
pkgdesc="Simple server used for FoxChat."
arch=('x86_64')
url="https://jd.pnc3.net/software/foxchat"
license=('Apache-2.0')
depends=()
makedepends=('cmake' 'gcc' 'make')
source=("https://github.com/Jacob-Meyers/FoxChat-FOSS/releases/download/$pkggitver/foxchat-server.tar.gz")
sha256sums=('ab75215cab1d105b0124ce5065a0061019d4c9b45c623ab3bfc44976f393d71c')

package() {
    install -Dm755 "$srcdir/foxchat-server" "$pkgdir/usr/bin/foxchat-server"
}
