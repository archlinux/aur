# Maintainer: David Birks <david@tellus.space>
# Contributor: Mike Williamson <mike at korora dot ca>

pkgname=eksctl
pkgdesc='Command line tool for creating clusters on Amazon EKS'
pkgver=0.1.38
pkgrel=1
arch=('x86_64')
license=('Apache')
url='https://github.com/weaveworks/eksctl'
depends=('kubectl')
conflicts=('eksctl-bin')
source=("$pkgname-$pkgver.tar.gz::https://github.com/weaveworks/eksctl/releases/download/$pkgver/eksctl_Linux_amd64.tar.gz")
sha256sums=('3991f6938d783d7ce9217ca2b0f84241befb7d4ade7cda119934979df7f90364')

package() {
  mkdir -p "$pkgdir/usr/bin"
  install -D -m0755 "$srcdir"/eksctl "$pkgdir"/usr/bin/
}
