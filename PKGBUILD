# Maintainer: nasedkinpv <nasedkinpv@users.noreply.github.com>
pkgname=numr
pkgver=0.9.3
pkgrel=1
pkgdesc="A text calculator for natural language expressions with a vim-style TUI"
arch=('x86_64' 'aarch64')
url="https://github.com/nasedkinpv/numr"
license=('MIT')
depends=('gcc-libs')
provides=('numr' 'numr-cli')
conflicts=('numr-git')
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::https://github.com/nasedkinpv/numr/releases/download/v$pkgver/numr-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::https://github.com/nasedkinpv/numr/releases/download/v$pkgver/numr-v$pkgver-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('e1080b946fc34097023f5a4578d980fd839d964a83c4bf4108c327e29c4ed14b')
sha256sums_aarch64=('69f3744907847f4e1882f47bf16dc8f17f2292762bc505f6184aa7edf00d2f4e')

package() {
    install -Dm755 "numr" "$pkgdir/usr/bin/numr"
    install -Dm755 "numr-cli" "$pkgdir/usr/bin/numr-cli"
}
