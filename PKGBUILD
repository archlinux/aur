# Maintainer: Simon Weald <simon[at]simonweald[dot]com>

pkgname=kubefwd-bin
pkgdesc="kubefwd is a command line utility built to port forward some or all pods within a Kubernetes namespace."
pkgver=1.4.2
pkgrel=1
arch=('x86_64')
url="https://github.com/txn2/kubefwd"
license=('apache')
_binary=kubefwd
source=("$_binary-$pkgver::https://github.com/txn2/kubefwd/releases/download/$pkgver/kubefwd_linux_amd64.tar.gz")
sha256sums=('535129ed3f22203841b4a8264e99021abdde930c0412fe169c75841c6045926e')

package() {
  install -Dm 755 "$srcdir/$_binary-$pkgver" "$pkgdir/usr/bin/$_binary"
}
