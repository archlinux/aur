# Maintainer: Erica Marigold <hi@devcomp.xyz>

pkgname=lune-bin
pkgver=0.8.7
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
sha256sums_x86_64=('2096e61b4d95aa0ad7ee40dbce926e9327e4c15957e062966b17021e55ca7045')
sha256sums_aarch64=('7ac4cd4c220506b1d22bae130ba6e0a28427d128f68d967d583042e2b810d6dd')

package() {
	install -Dm755 -t "$pkgdir/usr/bin" lune
}
