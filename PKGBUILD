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
sha256sums=('90167cb4152cb6aa0a1cd1dfd256cb5d045e66f33bc7fd7177916c2b2310e483')

package() {
    install -Dm755 "$srcdir/foxchat-cli" "$pkgdir/usr/bin/foxchat-cli"
}
