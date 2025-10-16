# Maintainer: Erica Marigold <hi@devcomp.xyz>

pkgname=lune-bin
pkgver=0.10.3
pkgrel=1
pkgdesc="[Precompiled Binaries] A standalone Luau script runtime"
arch=(x86_64 aarch64)
conflicts=(lune lune-git)
url="https://lune-org.github.io/docs"
license=(MPL2)
depends=(glibc)
provides=(lune)
conflicts=(lune)
source_x86_64=("https://github.com/lune-org/lune/releases/download/v$pkgver/lune-$pkgver-linux-x86_64.zip")
source_aarch64=("https://github.com/lune-org/lune/releases/download/v$pkgver/lune-$pkgver-linux-aarch64.zip")
sha256sums_x86_64=('719211a245b2f11fbc9639dff6a708d253416e27828e8c636e8fabe1c2ce3b36')
sha256sums_aarch64=('1b714933afc279dde3a6b012e1039ba6cb6b1609c69305f1bbb1daeeaac8b0d8')

package() {
	install -Dm755 -t "$pkgdir/usr/bin" lune
}
