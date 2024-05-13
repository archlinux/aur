# Maintainer: Erica Marigold <hi@devcomp.xyz>

pkgname=lune-bin
pkgver=0.8.4
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
sha256sums_x86_64=('cabbc1b9a407122ed730b4dcc0debfe60f79a150fa1bab941fb5adcb5725e721')
sha256sums_aarch64=('bd4b9cc657e8b5df5c9938232b362fe903bf44c841ce4ebd3c423f9d19c6510b')

package() {
	install -Dm755 -t "$pkgdir/usr/bin" lune
}
