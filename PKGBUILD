# Maintainer: Erica Marigold <hi@devcomp.xyz>

pkgname=rojo-bin
pkgver=7.7.0_rc.1
_upstreamver="${pkgver//_/-}"
pkgrel=1
pkgdesc="[Precompiled Binaries] Rojo enables Roblox developers to use professional-grade software engineering tools"
arch=(x86_64 aarch64)
conflicts=(rojo rojo-git)
url="https://rojo.space"
license=(MPL2)
depends=(gcc-libs glibc)
provides=(rojo)
source_x86_64=("https://github.com/rojo-rbx/rojo/releases/download/v$_upstreamver/rojo-$_upstreamver-linux-x86_64.zip")
source_aarch64=("https://github.com/rojo-rbx/rojo/releases/download/v$_upstreamver/rojo-$_upstreamver-linux-aarch64.zip")
sha256sums_x86_64=('3d29a60590365303fdd2a1e3c4684e44da7c4eb4de2b19fcf9884cc20a1ccd0c')
sha256sums_aarch64=('ac3682b4efa83d4e05b960968f5d774ea33a852a13835246ee43197eaf66db3a')

package() {
  install -Dm755 -t "$pkgdir/usr/bin" rojo 
}

