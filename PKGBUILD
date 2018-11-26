# Maintainer: Simon Weald <simon[at]simonweald[dot]com>

pkgname=kubefwd-bin
_srcname=kubefwd
pkgdesc="kubefwd is a command line utility built to port forward some or all pods within a Kubernetes namespace."
pkgver=1.4.9
pkgrel=1
arch=('x86_64')
url="https://github.com/txn2/kubefwd"
license=('apache')
source=("$_srcname-$pkgver.tar.gz::https://github.com/txn2/kubefwd/releases/download/$pkgver/kubefwd_linux_amd64.tar.gz")
sha256sums=('6696ef96c463e68b3c311c4f7af63a6cfa2c06b75550e657b6db2700ffabbc34')

package() {
    cd ${srcdir}
    tar -xzf $_srcname-$pkgver.tar.gz
    install -Dm755 "$srcdir/$_srcname" "$pkgdir/usr/bin/$_srcname"
}
