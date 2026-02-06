# Maintainer: guimoz <me@guimoz.fr>

pkgname=surfpool-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="A drop-in replacement for solana-test-validator and IaC for Solana"
arch=('x86_64')
url="https://github.com/txtx/surfpool"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
source=("$pkgname-$pkgver.tar.gz::https://github.com/txtx/surfpool/releases/download/v$pkgver/surfpool-linux-x64.tar.gz")
sha256sums=('4812efc59f8f144a891df7fab9f52d88779fcf35ac8b6b5d6cdd5fb173bda7b1')

package() {
    install -Dm755 surfpool "$pkgdir/usr/bin/surfpool"
}
