# Maintainer: Simon Weald <simon[at]simonweald[dot]com>
# Maintainer: Tomas Kral <tomas.kral@gmail.com>

pkgname=kompose-bin
_srcname=kompose
pkgver=1.6.0
pkgrel=1
pkgdesc="Takes a Docker Compose file and translates it into Kubernetes resources"
url="http://kompose.io/"
license=('Apache')
arch=('x86_64')

source_x86_64=("$_srcname-$pkgver.tar.gz::https://github.com/kubernetes-incubator/kompose/releases/download/v$pkgver/kompose-linux-amd64.tar.gz")
sha256sums_x86_64=('0e48b92c124edf2d1dfbb604f2a13e475e1f284b1e84030a3526cf844cd9573d')


package() {
	cd ${srcdir}
	tar -xzf $_srcname-$pkgver.tar.gz
	install -Dm755 "$srcdir/kompose-linux-amd64" "$pkgdir/usr/bin/kompose"
}
