# Maintainer: Erica Marigold <hi@devcomp.xyz>

pkgname=lune-bin
pkgver=0.7.11
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
sha256sums_x86_64=('83035b5bddf925b03b905d641182bec3bee01fc661a59f201d814cf88e4e0189')
sha256sums_aarch64=('e627b82bc7a087f5abc20c3e4b7f754242998359cfdb984861c417edbc20c210')

package() {
  install -Dm755 -t "$pkgdir/usr/bin" lune
}
