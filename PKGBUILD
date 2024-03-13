# Maintainer: Erica Marigold <hi@devcomp.xyz>

pkgname=lune-bin
pkgver=0.8.2
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
sha256sums_x86_64=('b593235b9bfb7b91982d061c96a736fde0b1d0b28fd55f7121fd8c6be31332fa')
sha256sums_aarch64=('8fd9d7e08cbcf72abc63ce149fee79740d2fbb32d5372e0f5d5ffd8de5bb297b')

package() {
  install -Dm755 -t "$pkgdir/usr/bin" lune
}
