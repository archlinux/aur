# Maintainer: Erica Marigold <hi@devcomp.xyz>

pkgname=lune-bin
pkgver=0.9.2
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
sha256sums_x86_64=('5c3321fdc47827e74b9ad6098db9577ebddebd7f42fcd44b46be6c53e65a190e')
sha256sums_aarch64=('efa8f047e73ef731b1347b3c7665eef8d753e1739bda84610d592412db5ab7a4')

package() {
	install -Dm755 -t "$pkgdir/usr/bin" lune
}
