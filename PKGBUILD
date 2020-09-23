# Maintainer: Christopher Cooper <christopher@kelda.io>
pkgname=blimp-bin
pkgver=0.13.31
pkgrel=1
pkgdesc="CLI for Kelda's Blimp (Docker Compose for the Cloud)"
arch=('x86_64')
url="https://kelda.io/blimp"
license=('Apache')
optdepends=('docker: support for locally building custom images')
options=(!strip)
source=("https://blimp-releases.s3-us-west-1.amazonaws.com/blimp-linux-$pkgver")
sha256sums=('db6b8b3c7b9e3832c53d988b9bac8c6e1827f3c627b0e2a89238914d3158af0e')

package() {
	install -Dm 755 "$srcdir/blimp-linux-$pkgver" "$pkgdir/usr/bin/blimp"
}
