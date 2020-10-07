# Maintainer: Christopher Cooper <christopher@kelda.io>
pkgname=blimp-bin
pkgver=0.13.33
pkgrel=1
pkgdesc="CLI for Kelda's Blimp (Docker Compose for the Cloud)"
arch=('x86_64')
url="https://kelda.io/blimp"
license=('Apache')
optdepends=('docker: support for locally building custom images')
options=(!strip)
source=("https://blimp-releases.s3-us-west-1.amazonaws.com/blimp-linux-$pkgver")
sha256sums=('877767aa05afcf40664ede124306ebdf45b8a936894293806255cb87046d0345')

package() {
	install -Dm 755 "$srcdir/blimp-linux-$pkgver" "$pkgdir/usr/bin/blimp"
}
