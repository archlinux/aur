# Maintainer: Erica Marigold <hi@devcomp.xyz>

pkgname=rojo-bin
pkgver=7.6.1
pkgrel=1
pkgdesc="[Precompiled Binaries] Rojo enables Roblox developers to use professional-grade software engineering tools"
arch=(x86_64)
conflicts=(rojo rojo-git)
url="https://rojo.space"
license=(MPL2)
depends=(gcc-libs glibc)
provides=(rojo)
source_x86_64=("https://github.com/rojo-rbx/rojo/releases/download/v$pkgver/rojo-$pkgver-linux-x86_64.zip")
sha256sums_x86_64=('a9542a713036897fdbd0173e7a105ea409658333133c949025fcb6f1a7ca909d')

package() {
  install -Dm755 -t "$pkgdir/usr/bin" rojo 
}

