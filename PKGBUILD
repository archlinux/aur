# Maintainer: Christopher Cooper <christopher@kelda.io>
pkgname=blimp-bin
pkgver=0.13.34
pkgrel=1
pkgdesc="CLI for Kelda's Blimp (Docker Compose for the Cloud)"
arch=('x86_64')
url="https://kelda.io/blimp"
license=('Apache')
optdepends=('docker: support for locally building custom images')
options=(!strip)
source=("https://blimp-releases.s3-us-west-1.amazonaws.com/blimp-linux-$pkgver")
sha256sums=('9e753c87dc4d3b994be94e60b98a820b45013c40c3e13f21d245511cd5f8c4fa')

package() {
	install -Dm 755 "$srcdir/blimp-linux-$pkgver" "$pkgdir/usr/bin/blimp"
}
