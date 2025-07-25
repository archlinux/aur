# Maintainer: tarball <bootctl@gmail.com>

# Thanks to an old but deleted package, 'ht-bin' is no longer available
pkgname=ht-term-bin
pkgver=0.4.0
pkgrel=1
pkgdesc='headless terminal: wrap any binary with a terminal interface'
arch=('x86_64' 'aarch64')
url='https://github.com/andyk/ht'
license=('Apache-2.0')
depends=('glibc' 'gcc-libs')
provides=(ht)
conflicts=(ht)
source_x86_64=("ht-$pkgver-x86_64::$url/releases/download/v$pkgver/ht-x86_64-unknown-linux-gnu")
source_aarch64=("ht-$pkgver-aarch64::$url/releases/download/v$pkgver/ht-aarch64-unknown-linux-gnu")

sha256sums_x86_64=('44f16107bb35091aa3dca0d79e0fa249bf7d301adabe92b9a59187130bd10000')
sha256sums_aarch64=('aa2a0055996e634aef7a9448a5f1b28a6d1b4cee93b687f5b800f01b8a540a74')

package() {
  install -Dm755 "ht-$pkgver-$CARCH" \
    "$pkgdir/usr/bin/ht"
}
