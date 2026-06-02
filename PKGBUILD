# Maintainer: George Oastler <goastler4 at gmail dot com>
# SPDX-License-Identifier: 0BSD
pkgname=snortal
pkgver=1.0.17
pkgrel=1
pkgdesc='Detect captive portal URLs on a Linux network'
arch=('x86_64' 'aarch64' 'armv7h' 'armv6h' 'i686' 'riscv64')
url='https://github.com/goastler/snortal'
license=('AGPL-3.0-or-later')
source_x86_64=("snortal-x86_64-${pkgver}::https://github.com/goastler/snortal/releases/download/v1.0.17/snortal-linux-x86_64")
source_aarch64=("snortal-aarch64-${pkgver}::https://github.com/goastler/snortal/releases/download/v1.0.17/snortal-linux-aarch64")
source_armv7h=("snortal-armv7h-${pkgver}::https://github.com/goastler/snortal/releases/download/v1.0.17/snortal-linux-armv7")
source_armv6h=("snortal-armv6h-${pkgver}::https://github.com/goastler/snortal/releases/download/v1.0.17/snortal-linux-armv6-hf")
source_i686=("snortal-i686-${pkgver}::https://github.com/goastler/snortal/releases/download/v1.0.17/snortal-linux-x86")
source_riscv64=("snortal-riscv64-${pkgver}::https://github.com/goastler/snortal/releases/download/v1.0.17/snortal-linux-riscv64")
sha256sums_x86_64=('971a4d753c6c91582dc2847ca56c2685d5770c959f18f5d59d8eb001f4b0b7e7')
sha256sums_aarch64=('a49cb40b6b37b5895d0612f7cbe338e3c7af32c6b4ef3d217d50551a89260830')
sha256sums_armv7h=('5110db8aa2205be0b72768ee854bd9cc6abea0970cfc222251bdf38206d55a2e')
sha256sums_armv6h=('cac3ed6428191f46021b16cb653c0497fc584a6df1d3296b8710c7fd17bad0bf')
sha256sums_i686=('482800b57b90be7bea1d083757ab751b0f645b1137bbff2cee2b8b9928592b18')
sha256sums_riscv64=('0603a7ef7bbe89e2895c2fbacd8b50469b0a69964c94f7def4fde3606575064a')

package() {
    install -Dm0755 "snortal-${CARCH}-${pkgver}" "$pkgdir/usr/bin/snortal"
}
