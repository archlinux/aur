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

sha256sums_x86_64=('e134cd214dd45df486e5d7204632818019f49393ae3448f4624ae33b7fdea493')
sha256sums_aarch64=('6165cf1d982d5e967db28243d8cf27a573aaf95713d400ebf93d8de639dd6ac9')


package() {
    install -Dm755 "$srcdir/bfg" "$pkgdir/usr/bin/bfg"
}
