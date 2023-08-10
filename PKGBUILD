# Maintainer: Erica Marigold <hi@devcomp.xyz>

pkgname=lune-bin
pkgver=0.7.6
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
sha256sums_x86_64=('012d1e7cf3df8f70b620e779d0c1bbb51df2d1df716a3dbfd3d0714da9b0cf6a')
sha256sums_aarch64=('2373ac940c59385074fd4a5abdf679395c35191fd91f43dc623416fec7f41d80')

package() {
  install -Dm755 -t "$pkgdir/usr/bin" lune
}
