# Maintainer: Simon Weald <simon[at]simonweald[dot]com>
# Maintainer: Tomas Kral <tomas.kral@gmail.com>

pkgname=kompose-bin
_srcname=kompose
pkgver=1.4.0
pkgrel=1
pkgdesc="Takes a Docker Compose file and translates it into Kubernetes resources"
url="http://kompose.io/"
license=('Apache')
arch=('x86_64')

source_x86_64=("$_srcname-$pkgver.tar.gz::https://github.com/kubernetes-incubator/kompose/releases/download/v$pkgver/kompose-linux-amd64.tar.gz")
sha256sums_x86_64=('ee6b64e3bae4ea39c218e0c111a8f5c54214f5024340ac925c2f4d7a42b3728c')


package() {
	cd ${srcdir}
	tar -xzf $_srcname-$pkgver.tar.gz
	install -Dm755 "$srcdir/kompose-linux-amd64" "$pkgdir/usr/bin/kompose"
}
