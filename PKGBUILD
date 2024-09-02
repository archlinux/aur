# Maintainer: Balazs Kezes <fp65fmwc@anonaddy.me>

pkgname=pkgtrim
pkgver=0.240828.3
pkgrel=1
pkgdesc="A package trimmer tool for Arch Linux and Ubuntu"
arch=("aarch64" "x86_64")
url="https://ypsu.github.io/pkgtrim"
license=("0BSD")
makedepends=("go")

package() {
	GOBIN="$pkgdir/usr/bin" go install "github.com/ypsu/$pkgname@v$pkgver"
}
