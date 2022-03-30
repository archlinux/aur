# Maintainer: Zhanibek Adilbekov <zhanibek.adilbekov@pm.me>

pkgname=kubectl-convert-bin
pkgver=1.23.5
pkgrel=1
pkgdesc='A kubectl plugin, which allows you to convert manifests between different API versions'
url='https://kubernetes.io/docs/tasks/tools/included/kubectl-convert-overview/'
source=("kubectl-convert.bin::https://dl.k8s.io/release/v${pkgver}/bin/linux/amd64/kubectl-convert")
license=('Apache')

arch=('x86_64')

b2sums=('bf01f13f3d94c273f37b635dfe3db192ceb277f1fe03abd43f5fe55b22832e6c0a59f3d2b2a3ca7524e90d88b49116c1e6758a970726d3c8c3377fc90105cf7c')

package() {
  cd "$srcdir"
  install -Dm755 "kubectl-convert.bin" "${pkgdir}/usr/bin/kubectl-convert"
}
