# Maintainer: tarball <bootctl@gmail.com>

# Thanks to an old but deleted package, 'ht-bin' is no longer available
pkgname=ht-term-bin
pkgver=0.2.0
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

sha256sums_x86_64=('da35806b336402158644b0b52817007536d7161d84b96282660b760f3e9216c1')
sha256sums_aarch64=('905e8877ee85fac8aaba83002822882201feb59ccac0e293dd017084ebb3babe')

package() {
  install -Dm755 "ht-$pkgver-$CARCH" \
    "$pkgdir/usr/bin/ht"
}
