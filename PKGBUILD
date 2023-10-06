# Maintainer: Erica Marigold <hi@devcomp.xyz>

pkgname=lune-bin
pkgver=0.7.8
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
sha256sums_x86_64=('b62a448f39c0385d0303ccf88533a54d3d42af7386b30ec706584563745a00af')
sha256sums_aarch64=('6724e6e4e459e15c426f23ed8211ec5369679ba6a96bf006f0ed6c99d9617d61')

package() {
  install -Dm755 -t "$pkgdir/usr/bin" lune
}
