# Maintainer: Erica Marigold <hi@devcomp.xyz>

pkgname=rojo-bin
pkgver=7.7.0
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
sha256sums_x86_64=('22503e5839864f9d7c2171c48b536fc229f2cc4d8774c9cc149f60941d864073')
sha256sums_aarch64=('7e60d864d4b735f4b1122cbe4e3db4c215fda97f596196df5c3e99f3f5387485')

package() {
  install -Dm755 -t "$pkgdir/usr/bin" rojo 
}

