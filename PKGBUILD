# Maintainer: tarball <bootctl@gmail.com>

# Thanks to an old but deleted package, 'ht-bin' is no longer available
pkgname=ht-term-bin
pkgver=0.3.0
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

sha256sums_x86_64=('08b64e5ef3c806d399edb3e27a9f81cf1a5b354366827a023db01a867c8bb118')
sha256sums_aarch64=('ea2e3554145dd87227f9a273620a6c4d499121d05c5bed34a1211769ec264313')

package() {
  install -Dm755 "ht-$pkgver-$CARCH" \
    "$pkgdir/usr/bin/ht"
}
