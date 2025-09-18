# Maintainer: Erica Marigold <hi@devcomp.xyz>

pkgname=lune-bin
pkgver=0.10.1
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
sha256sums_x86_64=('27d69f79ba74a1d60cb9324250c0360afef541307610acf20b5e25d309678709')
sha256sums_aarch64=('3037b418224635a3cd22644d3f618cad850f428c86423c750332f4282a253176')

package() {
	install -Dm755 -t "$pkgdir/usr/bin" lune
}
