# Maintainer: Erica Marigold <hi@devcomp.xyz>

pkgname=lune-bin
pkgver=0.8.5
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
sha256sums_x86_64=('591619c2b8960eb532a07edba180f863486f927a40752fbb698fef9cff5bb5c9')
sha256sums_aarch64=('1b89932c0ad5af862ac3d4572bb60527015d2e33641d05d180d4a39b302ffab2')

package() {
	install -Dm755 -t "$pkgdir/usr/bin" lune
}
