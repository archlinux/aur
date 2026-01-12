# Maintainer: nasedkinpv <nasedkinpv@users.noreply.github.com>
pkgname=numr
pkgver=0.4.1
pkgrel=1
pkgdesc="A text calculator for natural language expressions with a vim-style TUI"
arch=('x86_64')
url="https://github.com/nasedkinpv/numr"
license=('MIT')
depends=('gcc-libs')
provides=('numr' 'numr-cli')
conflicts=('numr-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nasedkinpv/numr/releases/download/v$pkgver/numr-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('ba806a9870fa1157554f0208b99e160c4d0d6a04d0bd4437c70783b2e3d522ab')

package() {
    install -Dm755 "numr" "$pkgdir/usr/bin/numr"
    install -Dm755 "numr-cli" "$pkgdir/usr/bin/numr-cli"
}
