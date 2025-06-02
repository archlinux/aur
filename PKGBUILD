# Maintainer: Enrique <1enrique3@protonmail.com>

pkgname=rokit-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Next-generation toolchain manager for Roblox projects."
arch=('x86_64' 'aarch64')
url="https://github.com/rojo-rbx/rokit"
license=('MIT')
source_x86_64=("https://github.com/rojo-rbx/rokit/releases/download/v$pkgver/rokit-$pkgver-linux-x86_64.zip")
source_aarch64=("https://github.com/rojo-rbx/rokit/releases/download/v$pkgver/rokit-$pkgver-linux-aarch64.zip")
sha512sums_x86_64=('5818226302680b9b513f8576233a1ca4ab3759431f69678b4f3e97f5c24505ef2b6e380b89c5543a5827ef1d463e94eaede0021a782dbe7c7a6b54d1e08cfbb7')
sha512sums_aarch64=('3940d5e72f47d3a07d44c7c2a0d2acbc5b11ae53d06c1cdfc38229c1750e92bbc945b89f5bb7a74ee253755b6d5beab6f67b9181c337bc24027518ca05498b7e')

package() {
	install -Dm755 rokit "$pkgdir/usr/bin/rokit"
}