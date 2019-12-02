# Maintainer: Simon Weald <simon[at]simonweald[dot]com>

pkgname=kubefwd-bin
_srcname=kubefwd
pkgdesc="kubefwd is a command line utility built to port forward some or all pods within a Kubernetes namespace."
pkgver=1.11.0
pkgrel=1
arch=('x86_64')
url="https://github.com/txn2/kubefwd"
license=('apache')
source=("$_srcname-$pkgver.tar.gz::https://github.com/txn2/kubefwd/releases/download/$pkgver/kubefwd_linux_amd64.tar.gz")
sha256sums=('84a0788a44cd1b9035da2177e47fa706fcd2984e002f1534e95156af5f14cca7')

package() {
    cd ${srcdir}
    tar -xzf $_srcname-$pkgver.tar.gz
    install -Dm755 "$srcdir/$_srcname" "$pkgdir/usr/bin/$_srcname"
}
