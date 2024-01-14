# Maintainer: Erica Marigold <hi@devcomp.xyz>

pkgname=lune-bin
pkgver=0.8.0
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
sha256sums_x86_64=('88169f58a48c0545bfeb887c92d7dce50f0995425e286dff406b1e602f5c3faa')
sha256sums_aarch64=('1b116492eda497f4252f32c49f752bb802d7ef7eb33cc69f39a09ac10ee36843')

package() {
  install -Dm755 -t "$pkgdir/usr/bin" lune
}
