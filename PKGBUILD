# Maintainer: Simon Weald <simon[at]simonweald[dot]com>

pkgname=kompose-bin
_srcname=kompose
pkgver=1.0.0
pkgrel=1
pkgdesc="Takes a Docker Compose file and translates it into Kubernetes resources"
url="http://kompose.io/"
license=('Apache')
arch=('x86_64')
[ "$CARCH" = 'x86_64' ] && _arch='linux-amd64'

source_x86_64=("$_srcname-$pkgver::https://github.com/kubernetes-incubator/kompose/releases/download/v$pkgver/kompose-linux-amd64.tar.gz")
md5sums_x86_64=('9e7aa088318c54b81d25bae5640fa1af')


package() {
	install -Dm755 "$srcdir/$_srcname-$pkgver" "$pkgdir/usr/bin/kompose"
}
