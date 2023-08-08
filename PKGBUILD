# Maintainer: Erica Marigold <hi@devcomp.xyz>

pkgname=lune-bin
pkgver=0.7.5
pkgrel=2
pkgdesc="[Precompiled Binaries] A standalone Luau script runtime"
arch=(x86_64 aarch64)
conflicts=(lune lune-git)
url="https://lune-org.github.io/docs"
license=(MPL2)
depends=(glibc)
provides=(lune)
conflicts=(lune)
source_x86_64=("https://github.com/filiptibell/lune/releases/download/v$pkgver/lune-$pkgver-linux-x86_64.zip")
source_aarch64=("https://github.com/filiptibell/lune/releases/download/v$pkgver/lune-$pkgver-linux-aarch64.zip")
sha256sums_x86_64=('eaec8e6361c8f9b4e63f756cc9b83a94bbbba28b060e5338a144e499aae2881c')
sha256sums_aarch64=('dad5292299db3359c8676c8e294cb9b30105ad1a47f9d96ee99fa34f2684f4fd')

package() {
  install -Dm755 -t "$pkgdir/usr/bin" lune
}
