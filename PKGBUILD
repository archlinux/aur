# Maintainer: David Birks <david@tellus.space>
# Contributor: Mike Williamson <mike at korora dot ca>

pkgname=eksctl
pkgdesc='Command line tool for creating clusters on Amazon EKS'
pkgver=0.1.11
pkgrel=1
arch=('x86_64')
license=('Apache')
url='https://github.com/weaveworks/eksctl'
depends=('kubectl')
source=("$pkgname-$pkgver.tar.gz::https://github.com/weaveworks/eksctl/releases/download/$pkgver/eksctl_Linux_amd64.tar.gz")
sha256sums=('797b814d93f7a594bd48e7cb369a11f18cb61aa80097460ed96d8a77bc968d15')

package() {
  mkdir -p "$pkgdir/usr/bin"
  install -D -m0755 "$srcdir"/eksctl "$pkgdir"/usr/bin/
}
