# Maintainer: Erica Marigold <hi@devcomp.xyz>

pkgname=lune-bin
pkgver=0.8.9
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
sha256sums_x86_64=('eb30bdde967ba97951a4e0cafa0a197396ddd68dfc58e1b60349129c178eee8b')
sha256sums_aarch64=('913b07e1c42b8f8fc9e11a1f9d8b07e903e97efcf42b109d60326e85f5cc3cb7')

package() {
	install -Dm755 -t "$pkgdir/usr/bin" lune
}
