# Maintainer: Jacob Meyers <jeyersdev@gmail.com>
pkgname=foxchat-cli
pkgver=2026
pkgrel=5.8
pkggitver=v5.8.2026
pkgdesc="FoxChat client entirely in the terminal."
arch=('x86_64')
url="https://jd.pnc3.net/software/foxchat"
license=('Apache-2.0')
depends=()
makedepends=('cmake' 'gcc' 'make')
source=("https://github.com/Jacob-Meyers/FoxChat-FOSS/releases/download/$pkggitver/foxchat-cli.tar.gz")
sha256sums=('e57248f36448bfdf604d2e08f9ae9a10b684fb519e4f7004e8e5ce502c3ca3ef')

package() {
    install -Dm755 "$srcdir/foxchat-cli" "$pkgdir/usr/bin/foxchat-cli"
}
