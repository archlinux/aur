# Maintainer: nasedkinpv <nasedkinpv@users.noreply.github.com>
pkgname=numr
pkgver=0.9.2
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
sha256sums_x86_64=('2923e6270907f63c52a655df2c7eb94fb971c164c709147111f131e3a53b1454')
sha256sums_aarch64=('5c36d7b3f7dacf95a8e441b68d46faf15f3678e9679681db6fe154e7497cdb17')

package() {
    install -Dm755 "numr" "$pkgdir/usr/bin/numr"
    install -Dm755 "numr-cli" "$pkgdir/usr/bin/numr-cli"
}
