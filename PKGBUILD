# Maintainer: nasedkinpv <nasedkinpv@users.noreply.github.com>
pkgname=numr
pkgver=0.9.1
pkgrel=1
pkgdesc="A text calculator for natural language expressions with a vim-style TUI"
arch=('x86_64')
url="https://github.com/nasedkinpv/numr"
license=('MIT')
depends=('gcc-libs')
provides=('numr' 'numr-cli')
conflicts=('numr-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nasedkinpv/numr/releases/download/v$pkgver/numr-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('ebf9cd7211b0fd714c11f6127d635a6f2ddfc8ddcb453053791d7eac8efbf820')

package() {
    install -Dm755 "numr" "$pkgdir/usr/bin/numr"
    install -Dm755 "numr-cli" "$pkgdir/usr/bin/numr-cli"
}
