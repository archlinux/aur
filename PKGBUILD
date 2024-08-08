# Maintainer: drpebcak <tayworm@gmail.com>
pkgname='eksctl-latest'
pkgver="latest"
pkgrel=1
pkgdesc="The official CLI for Amazon EKS"
arch=('x86_64')
url="https://eksctl.io"
license=('Apache')
source=("eksctl_Linux_amd64.tar.gz::https://github.com/eksctl-io/eksctl/releases/latest/download/eksctl_Linux_amd64.tar.gz")
md5sums=('SKIP')

package() {
  cd "$srcdir"
  tar -xzf eksctl_Linux_amd64.tar.gz
  install -Dm755 "eksctl" "$pkgdir/usr/bin/eksctl"
}