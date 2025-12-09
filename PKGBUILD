# Maintainer: guimoz <me@guimoz.fr>

pkgname=surfpool-bin
pkgver=0.12.0
pkgrel=1
pkgdesc="A drop-in replacement for solana-test-validator and IaC for Solana"
arch=('x86_64')
url="https://github.com/txtx/surfpool"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
source=("$pkgname-$pkgver.tar.gz::https://github.com/txtx/surfpool/releases/download/v$pkgver/surfpool-linux-x64.tar.gz")
sha256sums=('5b39cf5374ce29ac0476181cb910d666a0e1c638f7ea5905cc94965a120064de')

package() {
    install -Dm755 surfpool "$pkgdir/usr/bin/surfpool"
}
