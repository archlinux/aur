# Maintainer: George Oastler <goastler4 at gmail dot com>
# SPDX-License-Identifier: 0BSD
pkgname=snortal
pkgver=1.0.18
pkgrel=1
pkgdesc='Detect captive portal URLs on a Linux network'
arch=('x86_64' 'aarch64' 'armv7h' 'armv6h' 'i686' 'riscv64')
url='https://github.com/goastler/snortal'
license=('AGPL-3.0-or-later')
source_x86_64=("snortal::https://github.com/goastler/snortal/releases/download/v1.0.18/snortal-linux-x86_64")
source_aarch64=("snortal::https://github.com/goastler/snortal/releases/download/v1.0.18/snortal-linux-aarch64")
source_armv7h=("snortal::https://github.com/goastler/snortal/releases/download/v1.0.18/snortal-linux-armv7")
source_armv6h=("snortal::https://github.com/goastler/snortal/releases/download/v1.0.18/snortal-linux-armv6-hf")
source_i686=("snortal::https://github.com/goastler/snortal/releases/download/v1.0.18/snortal-linux-x86")
source_riscv64=("snortal::https://github.com/goastler/snortal/releases/download/v1.0.18/snortal-linux-riscv64")
sha256sums_x86_64=('2a7b05f07ed82e4bb8680b2c0529afeeb6f9f4f7c39741cbd91c0e73a41b09f0')
sha256sums_aarch64=('e870863510d237df952adea26d6f6ca2db3844729eb25d6bbce4d164e22ffa5f')
sha256sums_armv7h=('654dfd6c949e03e786311b6e6cb2fbf60fdd3080f18afa100bd29823a6dd2434')
sha256sums_armv6h=('46fa5c0ca219bb33cc883e8f946ddb1f4a076cc11eee4b402d5de85d60818a74')
sha256sums_i686=('2512514f58d646f681f7f00cf2809bf6b0474cd2f99f677cb297e288402233ae')
sha256sums_riscv64=('a363a07be45c9591e8bb417d0dd3c87c33144b4faa50844d1bb962c36b0ee3b0')

package() {
    install -Dm0755 snortal "$pkgdir/usr/bin/snortal"
}
