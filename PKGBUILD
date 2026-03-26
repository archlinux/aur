pkgname=bfg-bin
pkgver=1.3
pkgrel=1
pkgdesc="precompiled binaries for bfg: a brainfuck interpterer"
arch=('x86_64' 'aarch64')
url="https://github.com/tjf1dev/bfg"
license=('Apache License 2.0')
depends=()

source_x86_64=("bfg::https://github.com/tjf1dev/bfg/releases/download/v${pkgver}/bfg-linux-x64-v${pkgver}")
source_aarch64=("bfg::https://github.com/tjf1dev/bfg/releases/download/v${pkgver}/bfg-linux-arm64-v${pkgver}")

sha256sums_x86_64=('66ab9f393ebeeeded6d64eed9079df7b6ba04ec6b944aa621fc4526ffd047e51')
sha256sums_aarch64=('6e6a31db0657641cdc69827a666c837a620b603a1a667cbef18e983138d06986')


package() {
    install -Dm755 "$srcdir/bfg" "$pkgdir/usr/bin/bfg"
}
