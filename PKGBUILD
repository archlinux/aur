# Maintainer: Erica Marigold <hi@devcomp.xyz>

pkgname=rojo-bin
pkgver=7.4.0
pkgrel=1
pkgdesc="[Precompiled Binaries] Rojo enables Roblox developers to use professional-grade software engineering tools"
arch=(x86_64)
conflicts=(rojo rojo-git)
url="https://rojo.space"
license=(MPL2)
depends=(gcc glibc)
provides=(rojo)
source_x86_64=("https://github.com/rojo-rbx/rojo/releases/download/v$pkgver/rojo-$pkgver-linux-x86_64.zip")
sha256sums_x86_64=('4901165086fe7822f7fd54def7907c6072c4b1b2f90697b9da00ddb40cf938a7')

package() {
  install -Dm755 -t "$pkgdir/usr/bin" rojo 
}

