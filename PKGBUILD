# Maintainer: Erica Marigold <hi@devcomp.xyz>

pkgname=lune-bin
pkgver=0.9.1
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
sha256sums_x86_64=('e646717f5f454d7bc392cdd15e43fe6636ded51283561bb31bdb6b25af03173a')
sha256sums_aarch64=('adb8cfbecf11ccb8a69549819e1eb67d5525daca2f7f594fe9c6e037155b06b1')

package() {
	install -Dm755 -t "$pkgdir/usr/bin" lune
}
