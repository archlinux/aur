# Maintainer: Erica Marigold <hi@devcomp.xyz>

pkgname=lune-bin
pkgver=0.8.6
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
sha256sums_x86_64=('858529f9f4bf329ce8eb8d92e3496a07c673a275c130a9cad2872f90a5fcbfc7')
sha256sums_aarch64=('dc3f30fbf6bdeb26ee64ec0c14fe5e2363ea9aedc76ea7abe8cede54e033e377')

package() {
	install -Dm755 -t "$pkgdir/usr/bin" lune
}
