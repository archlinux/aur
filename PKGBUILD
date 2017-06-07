# Maintainer: Simon Weald <simon[at]simonweald[dot]com>

pkgname=kompose-bin
_srcname=kompose
pkgver=0.7.0
pkgrel=1
pkgdesc="Takes a Docker Compose file and translates it into Kubernetes resources"
url="http://kompose.io/"
license=('Apache')
arch=('x86_64')
[ "$CARCH" = 'x86_64' ] && _arch='linux-amd64'

source_x86_64=("https://github.com/kubernetes-incubator/kompose/releases/download/v$pkgver/kompose-linux-amd64.tar.gz")
md5sums_x86_64=('b56153e9fd6cf5895c1a96f0c83e8320')


package() {
	install -Dm755 "$srcdir/$_srcname-$_arch" "$pkgdir/usr/bin/kompose"
}
