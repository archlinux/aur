# Maintainer: Sam A. Horvath-Hunt <hello@samhh.com>

pkgname=tshm-bin
pkgver=0.4.2
pkgrel=1
pkgdesc="Parser and formatter for TypeScript declarations that outputs HM-style type signatures"
url="https://github.com/samhh/tshm"
arch=("x86_64")
license=("MIT")
source=(
    "$url/releases/download/$pkgver/tshm-$pkgver-linux-x86_64"
    "LICENSE"
)
sha256sums=('733041552fcdfc09e47f2897690f88edc194a8cd76e21ec7b79ac53c93008c2d'
            '3440871ff80806ee4369048b13f1557aa609ca9f655040c44a219d4b844425ba')

package() {
    install -Dm755 "tshm-$pkgver-linux-x86_64" "$pkgdir/usr/bin/tshm"
    install -Dm644 "./LICENSE" "$pkgdir/usr/share/licenses/tshm/LICENSE"
}

