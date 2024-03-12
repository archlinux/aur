# Maintainer: Erica Marigold <hi@devcomp.xyz>

pkgname=lune-bin
pkgver=0.8.1
pkgrel=1
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
sha256sums_x86_64=('a4ae71b81cafc04a2ecd632381b06609cbedd7d5f479457fea60388afc0e9e27')
sha256sums_aarch64=('1313640a246553e9c72fd1983bd9a764a1739459017ed51a44d411fe7dbd1e0a')

package() {
  install -Dm755 -t "$pkgdir/usr/bin" lune
}
