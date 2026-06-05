# Maintainer: Erica Marigold <hi@devcomp.xyz>

pkgname=lune-bin
pkgver=0.10.4
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
sha256sums_x86_64=('ffba0bd404ae078c9543ef5ac12479938a741aab255768a11a08517ae963b288')
sha256sums_aarch64=('e40c24c3c3dac869ab5715d2cd42ec03bc874e0fe901e5b19932313f06ddcb31')

package() {
	install -Dm755 -t "$pkgdir/usr/bin" lune
}
