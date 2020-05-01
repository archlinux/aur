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
	"170b04de633379e20f9c9b600016d7e743c74e7d4154078e306b60e9d4559892581bb9ff86f7cbef7f42ca32ed92be698cce7f103a05dfac8148ddf7e9c5f27a"
)

package()
{
    install -d "$pkgdir/opt"

	cp -r "proton-clang-$pkgver" "$pkgdir/opt/proton-clang"
}
