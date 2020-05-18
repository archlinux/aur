# Maintainer: Simon Weald <simon[at]simonweald[dot]com>

pkgname=kubefwd-bin
_srcname=kubefwd
pkgdesc="kubefwd is a command line utility built to port forward some or all pods within a Kubernetes namespace."
pkgver=1.13.1
pkgrel=1
arch=('x86_64')
url="https://github.com/txn2/kubefwd"
license=('apache')
source=("$_srcname-$pkgver.tar.gz::https://github.com/txn2/kubefwd/releases/download/$pkgver/kubefwd_linux_amd64.tar.gz")
sha256sums=('0b3d4abe58ffcba62ecdc8caed586e6291f4ec5e4800e7ba2adaf56c8f14832d')

package() {
    cd ${srcdir}
    tar -xzf $_srcname-$pkgver.tar.gz
    install -Dm755 "$srcdir/$_srcname" "$pkgdir/usr/bin/$_srcname"
}
