# Maintainer: Erica Marigold <hi@devcomp.xyz>

pkgname=lune-bin
pkgver=0.8.8
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
sha256sums_x86_64=('a17567d00eb7300418d9529501f4271a18662af7de17786cad50abbf56f387c5')
sha256sums_aarch64=('d0f23579bd83d1805a28d52f2e37678e40053dae797de0a6fafd2ecbaaf325f9')

package() {
	install -Dm755 -t "$pkgdir/usr/bin" lune
}
