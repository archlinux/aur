# Maintainer: Erica Marigold <hi@devcomp.xyz>

pkgname=lune-bin
pkgver=0.8.3
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
sha256sums_x86_64=('53296bc15d492476eb8470c5906a22d67e6628dc85b01d104ed00f7b9a98a695')
sha256sums_aarch64=('abd8c459f2ec58c73e4477c9803686f9b71124b5c799b3849c39e4c80a8aa435')

package() {
	install -Dm755 -t "$pkgdir/usr/bin" lune
}
