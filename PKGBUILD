# Maintainer: Erica Marigold <hi@devcomp.xyz>

pkgname=rojo-bin
pkgver=7.5.1
pkgrel=1
pkgdesc="[Precompiled Binaries] Rojo enables Roblox developers to use professional-grade software engineering tools"
arch=(x86_64)
conflicts=(rojo rojo-git)
url="https://rojo.space"
license=(MPL2)
depends=(gcc-libs glibc)
provides=(rojo)
source_x86_64=("https://github.com/rojo-rbx/rojo/releases/download/v$pkgver/rojo-$pkgver-linux-x86_64.zip")
sha256sums_x86_64=('0d600df6c4c48a9d09c701d0c2a109c55c2db833cd9766fd7d1e6e2684843d53')

package() {
  install -Dm755 -t "$pkgdir/usr/bin" rojo 
}

