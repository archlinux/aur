# Maintainer: Erica Marigold <hi@devcomp.xyz>

pkgname=lune-bin
pkgver=0.10.0
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
sha256sums_x86_64=('5444ca722fbf1d91e6da81bc48a439a030284b545385815ee1481eca05948b03')
sha256sums_aarch64=('e0f73bba03f76f3f038f805cbafab10b79e31d18989bb06ac5aaa8e842ec501b')

package() {
	install -Dm755 -t "$pkgdir/usr/bin" lune
}
