# Maintainer: Erica Marigold <hi@devcomp.xyz>

pkgname=lune-bin
pkgver=0.9.4
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
sha256sums_x86_64=('7217ceca10b0c8b89d7fa62db5c0735d090b93c20218ee9bc934aca155539c39')
sha256sums_aarch64=('bedcaa4c9cce258580b4b08710318fae6bfc50804c01affde3302b5702fc1cb0')

package() {
	install -Dm755 -t "$pkgdir/usr/bin" lune
}
