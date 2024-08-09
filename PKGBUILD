# Maintainer: Erica Marigold <hi@devcomp.xyz>

pkgname=rojo-bin
pkgver=7.4.3
pkgrel=1
pkgdesc="[Precompiled Binaries] Rojo enables Roblox developers to use professional-grade software engineering tools"
arch=(x86_64)
conflicts=(rojo rojo-git)
url="https://rojo.space"
license=(MPL2)
depends=(gcc-libs glibc)
provides=(rojo)
source_x86_64=("https://github.com/rojo-rbx/rojo/releases/download/v$pkgver/rojo-$pkgver-linux-x86_64.zip")
sha256sums_x86_64=('f5c28373a27e091f06d6bd421555cbab6c6695503f224d75a9716a2049e0e532')

package() {
  install -Dm755 -t "$pkgdir/usr/bin" rojo 
}

