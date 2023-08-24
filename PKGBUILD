# Maintainer: Erica Marigold <hi@devcomp.xyz>

pkgname=lune-bin
pkgver=0.7.7
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
sha256sums_x86_64=('51cc868c090fb2067de684eda479f93b1af4601302e1564f6cf11d36f939332f')
sha256sums_aarch64=('6167f392e56233b854bf2494fb31aefc0fe3c2d4c4a49db1755a44ec76d623c6')

package() {
  install -Dm755 -t "$pkgdir/usr/bin" lune
}
