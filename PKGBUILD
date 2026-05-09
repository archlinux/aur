# Maintainer: Jacob Meyers <jeyersdev@gmail.com>
pkgname=foxchat-server
pkgver=2026
pkgrel=5.801
pkggitver=v5.8.2026
pkgdesc="Simple server used for FoxChat."
arch=('x86_64')
url="https://jd.pnc3.net/software/foxchat"
license=('Apache-2.0')
depends=()
makedepends=('cmake' 'gcc' 'make')
source=("https://github.com/Jacob-Meyers/FoxChat-FOSS/releases/download/$pkggitver/foxchat-server.tar.gz")
sha256sums=('1ac2235db75a661f2978a0c23c07fe6fc16e8b504de2fa0dc4edc0490e1ac6da')

package() {
    install -Dm755 "$srcdir/foxchat-server" "$pkgdir/usr/bin/foxchat-server"
}
