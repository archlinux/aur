# Maintainer: Sam A. Horvath-Hunt <hello@samhh.com>

pkgname=tshm-bin
pkgver=0.4.0
pkgrel=2
pkgdesc="Parser and formatter for TypeScript declarations that outputs HM-style type signatures"
url="https://github.com/samhh/tshm"
arch=("x86_64")
license=("MIT")
source=(
    "$url/releases/download/$pkgver/tshm-linux-amd64"
    "LICENSE"
)
sha256sums=('ae8b310915be27b697cd64a2601b716007081b12d9538657c455d84a6f85d60e'
            '3440871ff80806ee4369048b13f1557aa609ca9f655040c44a219d4b844425ba')

package() {
    install -Dm755 "tshm-linux-amd64" "$pkgdir/usr/bin/tshm"
    install -Dm644 "./LICENSE" "$pkgdir/usr/share/licenses/tshm/LICENSE"
}

