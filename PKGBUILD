# Maintainer: Erica Marigold <hi@devcomp.xyz>

pkgname=lune-bin
pkgver=0.7.9
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
sha256sums_x86_64=('b463af81cad509ecff3a33758eeaf07e0f3a5b2a5eac8ef71e6f0c6eda0994a6')
sha256sums_aarch64=('e9c90eaf5eedc02241d3f4551af36c54a9ac8c1f2e640f5803e61364a05cf821')

package() {
  install -Dm755 -t "$pkgdir/usr/bin" lune
}
