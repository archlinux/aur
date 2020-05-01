# Maintainer: Diab Neiroukh <officiallazerl0rd@gmail.com>

pkgname="llvm-proton-bin"
pkgver=20200425
pkgrel=1
epoch=1
arch=(
	"x86_64"
)
pkgdesc="A LLVM and Clang compiler toolchain built for kernel development"
url="https://github.com/kdrag0n/proton-clang"
license=(
	"custom"
)
options=(
    "!strip"
)
source=(
	"https://github.com/kdrag0n/proton-clang/archive/$pkgver.tar.gz"
)
b2sums=(
	"SKIP"
)

package()
{
    install -d "$pkgdir/opt"

	cp -r "proton-clang-$pkgver" "$pkgdir/opt/proton-clang"
}
