# Maintainer: Erica Marigold <hi@devcomp.xyz>

pkgname=lune-bin
pkgver=0.9.0
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
sha256sums_x86_64=('ef95f9e3036c8353caed9fae0e7dd9269408066c73d37c3d9566916cecd026f2')
sha256sums_aarch64=('484f3b0976b73a21194f617472a2c2cc40550f10141fffbb52a13d77e6c95724')

package() {
	install -Dm755 -t "$pkgdir/usr/bin" lune
}
