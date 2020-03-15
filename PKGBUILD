# Maintainer: Simon Weald <simon[at]simonweald[dot]com>
# Maintainer: Tomas Kral <tomas.kral@gmail.com>

pkgname=kompose-bin
_srcname=kompose
pkgver=1.21.0
pkgrel=1
pkgdesc="Takes a Docker Compose file and translates it into Kubernetes resources"
url="http://kompose.io/"
license=('Apache')
arch=('x86_64')
source_x86_64=("$_srcname-$pkgver.tar.gz::https://github.com/kubernetes/kompose/releases/download/v$pkgver/kompose-linux-amd64.tar.gz")
sha256sums_x86_64=('88cac7b503cce5a4f83d3ac7690311307bc62a380e29b22a6557581c2b4c6d4d')

package() {
	cd ${srcdir}
	tar -xzf $_srcname-$pkgver.tar.gz
	install -Dm755 "$srcdir/kompose-linux-amd64" "$pkgdir/usr/bin/kompose"
}
