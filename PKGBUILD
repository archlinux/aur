# Maintainer: Simon Weald <simon[at]simonweald[dot]com>

pkgname=stern-bin
pkgdesc="Multi pod and container log tailing for Kubernetes"
pkgver=1.5.1
pkgrel=1
arch=('x86_64')
url="https://github.com/wercker/stern"
license=('apache')
_stern_file=stern_linux_amd64
source=("https://github.com/wercker/stern/releases/download/$pkgver/$_stern_file")
sha256sums=('3b7a89db0bede21d16e17625f245ce9d6f6a7267653ae06ac46bd21ae2835d76')

package() {
  install -Dm 755 "$srcdir/$_stern_file" "$pkgdir/usr/bin/stern"
}
