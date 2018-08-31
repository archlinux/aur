# Maintainer: Mike Williamson <mike at korora dot ca>
pkgname=eksctl
pkgdesc="A simple CLI tool for creating clusters on Amazon's EKS"
pkgver=0.1.1
pkgrel=2
arch=('x86_64')
license=("APACHE")
url="https://eksctl.io"
provides=('eksctl')
depends=('kubectl')
source=("https://github.com/weaveworks/eksctl/releases/download/$pkgver/eksctl_Linux_amd64.tar.gz")
sha256sums=('3dd3db30bee6b29ce6cf914cad78a0ca50dc0de03fd14685138ac011040df8ec')

package() {
  mkdir -p "$pkgdir/usr/bin"
  install -D -m0755 "$srcdir"/eksctl "$pkgdir"/usr/bin/
}

