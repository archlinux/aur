# Maintainer: nasedkinpv <nasedkinpv@users.noreply.github.com>
pkgname=numr
pkgver=0.9.0
pkgrel=1
pkgdesc="A text calculator for natural language expressions with a vim-style TUI"
arch=('x86_64')
url="https://github.com/nasedkinpv/numr"
license=('MIT')
depends=('gcc-libs')
provides=('numr' 'numr-cli')
conflicts=('numr-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nasedkinpv/numr/releases/download/v$pkgver/numr-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('7213b86d3fcbada0a831f8d29c307ec130dc28ed3549a45108d7ec5119d9a933')

package() {
    install -Dm755 "numr" "$pkgdir/usr/bin/numr"
    install -Dm755 "numr-cli" "$pkgdir/usr/bin/numr-cli"
}
