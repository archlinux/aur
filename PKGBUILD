# Maintainer: Erica Marigold <hi@devcomp.xyz>

pkgname=lune-bin
pkgver=0.9.3
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
sha256sums_x86_64=('08a69cf99ed989bea7b6e96066fe96fed6dfc26649c66b8e83a62916229c61ad')
sha256sums_aarch64=('9988028196769e9352c5c51db5b7b233c31d85239dde777a3e28695b6b421054')

package() {
	install -Dm755 -t "$pkgdir/usr/bin" lune
}
