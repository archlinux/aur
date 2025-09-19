# Maintainer: Erica Marigold <hi@devcomp.xyz>

pkgname=lune-bin
pkgver=0.10.2
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
sha256sums_x86_64=('2e83ba5c166102a46910b9f76f22f500bafa211896088c38e0c96821a6ca9ba3')
sha256sums_aarch64=('bfdfb907e8dfd78096091fed7745afa22432b6bc68b8d129edc440bd7321e5c0')

package() {
	install -Dm755 -t "$pkgdir/usr/bin" lune
}
