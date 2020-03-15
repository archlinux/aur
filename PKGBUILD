# Maintainer: Simon Weald <simon[at]simonweald[dot]com>

pkgname=kubefwd-bin
_srcname=kubefwd
pkgdesc="kubefwd is a command line utility built to port forward some or all pods within a Kubernetes namespace."
pkgver=1.12.0
pkgrel=1
arch=('x86_64')
url="https://github.com/txn2/kubefwd"
license=('apache')
source=("$_srcname-$pkgver.tar.gz::https://github.com/txn2/kubefwd/releases/download/$pkgver/kubefwd_linux_amd64.tar.gz")
sha256sums=('d3526d1f28ab2c2ff7b64ca4ca1672456244978a1a0e32317750d47e09678719')

package() {
    cd ${srcdir}
    tar -xzf $_srcname-$pkgver.tar.gz
    install -Dm755 "$srcdir/$_srcname" "$pkgdir/usr/bin/$_srcname"
}
