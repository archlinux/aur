# Maintainer: Erica Marigold <hi@devcomp.xyz>

pkgname=rojo-bin
pkgver=7.5.0
pkgrel=1
pkgdesc="[Precompiled Binaries] Rojo enables Roblox developers to use professional-grade software engineering tools"
arch=(x86_64)
conflicts=(rojo rojo-git)
url="https://rojo.space"
license=(MPL2)
depends=(gcc-libs glibc)
provides=(rojo)
source_x86_64=("https://github.com/rojo-rbx/rojo/releases/download/v$pkgver/rojo-$pkgver-linux-x86_64.zip")
sha256sums_x86_64=('89f40f19d7e772c3c0fd0fb265738f72498e69defa8f87f3b63e6f9ef3681955')

package() {
  install -Dm755 -t "$pkgdir/usr/bin" rojo 
}

