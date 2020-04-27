# Maintainer: Diab Neiroukh <officiallazerl0rd@gmail.com>

pkgname="llvm-proton-bin"
pkgver=11.0.0
pkgrel=1
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
	"https://github.com/kdrag0n/proton-clang/archive/master.zip"
)
b2sums=(
	"SKIP"
)

package()
{
    install -d "$pkgdir/opt"

	cp -r "proton-clang-master" "$pkgdir/opt/proton-clang"
}
