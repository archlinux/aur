# Maintainer: Sam A. Horvath-Hunt <hello@samhh.com>

pkgname=tshm-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="Parser and formatter for TypeScript declarations that outputs HM-style type signatures"
url="https://github.com/samhh/tshm/"
arch=("x86_64")
license=("MIT")
source=(
    "$url/releases/download/$pkgver/tshm-linux-amd64"
    "$url/archive/$pkgver.tar.gz"
)
sha256sums=(
    "ae8b310915be27b697cd64a2601b716007081b12d9538657c455d84a6f85d60e"
    "a40b8e8babfa7a70cdd290f2049c15ee687c3627188b0d1b79aa24f8758d4a8d"
)

package() {
    install -Dm755 "tshm-linux-amd64" "$pkgdir/usr/bin/tshm"
    install -Dm644 "$srcdir/tshm-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/tshm/LICENSE"
}

