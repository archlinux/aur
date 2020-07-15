# Maintainer: Christopher Cooper <christopher@kelda.io>
pkgname=blimp-bin
pkgver=0.13.16
pkgrel=1
pkgdesc="CLI for Kelda's Blimp (Docker Compose for the Cloud)"
arch=('x86_64')
url="https://kelda.io/blimp"
license=('Apache')
optdepends=('docker: support for locally building custom images')
options=(!strip)
source=("https://blimp-releases.s3-us-west-1.amazonaws.com/blimp-linux-$pkgver")
sha256sums=('b7889c444f7f38a62cd5271fb157d57b79ac1109ff703808b21e9900231aa62c')

package() {
	install -Dm 755 "$srcdir/blimp-linux-$pkgver" "$pkgdir/usr/bin/blimp"
}
