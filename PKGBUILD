# Maintainer: truemedian <truemedian at gmail dot com>
# Contributor: SoniEx2 <endermoneymod at gmail dot com>
pkgname=luvi-bin
pkgver=2.15.0
pkgrel=2
pkgdesc="A project in-between luv and luvit"
arch=(i686 x86_64 aarch64)
url="https://github.com/luvit/luvi"
license=('Apache-2.0')
depends=('glibc' 'gcc-libs')
provides=(luvi)
conflicts=(luvi)
source_i686=("luvi-regular-$pkgver-i686::https://github.com/luvit/luvi/releases/download/v$pkgver/luvi-Linux-i686-luajit-regular")
source_x86_64=("luvi-regular-$pkgver-x86_64::https://github.com/luvit/luvi/releases/download/v$pkgver/luvi-Linux-x86_64-luajit-regular")
source_aarch64=("luvi-regular-$pkgver-aarch64::https://github.com/luvit/luvi/releases/download/v$pkgver/luvi-Linux-aarch64-luajit-regular")
sha256sums_i686=('3c1d5842e2b738088bac6782012788a969a6ea4180b7fbf4a0e504dc62cbde1d')
sha256sums_x86_64=('609b3de65b84b4d21878b7324ec57d9119f7f1d1df56505ec043ce6790a9930f')
sha256sums_aarch64=('ae3ed680ba97da211e27bdb1971098f930da96daff9b47cfe1a9220b65da5802')

package() {
  cd "$srcdir"

  install -Dm755 "luvi-regular-$pkgver-$CARCH" "$pkgdir/usr/bin/luvi"
}
