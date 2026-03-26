pkgname=bfg-bin
pkgver=1.3.1
pkgrel=1
pkgdesc="precompiled binaries for bfg: a brainfuck interpterer"
arch=('x86_64' 'aarch64')
url="https://github.com/tjf1dev/bfg"
license=('Apache License 2.0')
depends=()

source_x86_64=("bfg::https://github.com/tjf1dev/bfg/releases/download/v${pkgver}/bfg-linux-x64-v${pkgver}")
source_aarch64=("bfg::https://github.com/tjf1dev/bfg/releases/download/v${pkgver}/bfg-linux-arm64-v${pkgver}")

sha256sums_x86_64=('734ddbb3c7f48dd5d9dcb8fc931b878b51b50e6740d2a50b41b30574598c21ae')
sha256sums_aarch64=('0fd46b66a68e2a07d352f35f10d26de7a85ffc2944b48f62aaaf27d5c4e41edb')


package() {
    install -Dm755 "$srcdir/bfg" "$pkgdir/usr/bin/bfg"
}
