# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: Simon Legner <Simon.Legner@gmail.com>
pkgname=spectre-meltdown-checker
pkgver=26.33.0420460
pkgrel=1
pkgdesc="Check system resilience against transient execution CVEs published since 2018"
arch=('any')
url="https://github.com/speed47/spectre-meltdown-checker"
license=(GPL-3.0-only)
source=("$pkgname-$pkgver.tar.gz::https://github.com/speed47/$pkgname/archive/v$pkgver.tar.gz")
b2sums=('b608125283bd755b02834f00cb8d26d0394bfc10794377216f342262f417347f6d9db008d55c9bca89ddf22566d936caeedd21fa365f75d5cd433a2a6502bd59')

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 spectre-meltdown-checker.sh "$pkgdir/usr/bin/spectre-meltdown-checker"
}
