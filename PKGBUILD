# Maintainer: Christopher Cooper <christopher@kelda.io>
pkgname=blimp-bin
pkgver=0.13.24
pkgrel=1
pkgdesc="CLI for Kelda's Blimp (Docker Compose for the Cloud)"
arch=('x86_64')
url="https://kelda.io/blimp"
license=('Apache')
optdepends=('docker: support for locally building custom images')
options=(!strip)
source=("https://blimp-releases.s3-us-west-1.amazonaws.com/blimp-linux-$pkgver")
sha256sums=('28ced1f70157b105cc3d5d561bb43186da234bd13911f9efd8524880c35437ce')

package() {
	install -Dm 755 "$srcdir/blimp-linux-$pkgver" "$pkgdir/usr/bin/blimp"
}
