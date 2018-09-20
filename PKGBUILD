# Maintainer: Mike Williamson <mike at korora dot ca>
pkgname=eksctl
pkgdesc="A simple CLI tool for creating clusters on Amazon's EKS"
pkgver=0.1.2
pkgrel=2
arch=('x86_64')
license=("APACHE")
url="https://eksctl.io"
provides=('eksctl')
depends=('kubectl')
source=("https://github.com/weaveworks/eksctl/releases/download/$pkgver/eksctl_Linux_amd64.tar.gz")
sha256sums=('ad45513ce77a5d88a569591679c7fde1a525fd46b4cc7031ac10f3e8bd3cb5d2')

package() {
  mkdir -p "$pkgdir/usr/bin"
  install -D -m0755 "$srcdir"/eksctl "$pkgdir"/usr/bin/
}

