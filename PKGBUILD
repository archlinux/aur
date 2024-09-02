# Maintainer: Balazs Kezes <fp65fmwc@anonaddy.me>

pkgname=pkgtrim
pkgver=0.240828.3
pkgrel=1
pkgdesc="A package trimmer tool for Arch Linux and Ubuntu"
arch=("i686" "pentium4" "x86_64" "arm" "armv7h" "armv6h" "aarch64" "riscv64")
url="https://ypsu.github.io/pkgtrim"
license=("0BSD")
makedepends=("go")

package() {
	GOPATH="$srcdir"/gopath GOBIN="$pkgdir/usr/bin" go install "github.com/ypsu/$pkgname@v$pkgver"
}
