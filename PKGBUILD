# Maintainer: tarball <bootctl@gmail.com>

# Thanks to an old but deleted package, 'ht-bin' is no longer available
pkgname=ht-term-bin
pkgver=0.1.1
pkgrel=1
pkgdesc='headless terminal: wrap any binary with a terminal interface'
arch=('x86_64' 'aarch64')
url='https://github.com/andyk/ht'
license=('Apache-2.0')
depends=('glibc' 'gcc-libs')
provides=(ht)
conflicts=(ht)
source_x86_64=("ht-$pkgver-x86_64::$url/releases/download/v$pkgver/ht-x86_64-unknown-linux-gnu.ht-x86_64-unknown-linux-gnu")
source_aarch64=("ht-$pkgver-aarch64::$url/releases/download/v$pkgver/ht-aarch64-unknown-linux-gnu.ht-aarch64-unknown-linux-gnu")
sha256sums_x86_64=('830f9b42fdf528d798899bba1eedb4bb6b53f0ead6a5ab9009e55672346014f6')
sha256sums_aarch64=('0b6e2e98c2830ca725b949d09304ebfdd79ef10ae53f3ddb414198d12fa52d75')

package() {
  install -Dm755 "ht-$pkgver-$CARCH" \
    "$pkgdir/usr/bin/ht"
}
