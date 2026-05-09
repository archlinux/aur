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
sha256sums=('3da6942216d46a4086950bcf32dde019ade23791679ccd5f06a38803530c1121')

package() {
    install -Dm755 "$srcdir/foxchat-cli" "$pkgdir/usr/bin/foxchat-cli"
}
