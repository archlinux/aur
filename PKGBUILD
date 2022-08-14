# Maintainer: Zhanibek Adilbekov <zhanibek.adilbekov@pm.me>

pkgname=kubectl-convert-bin
pkgver=1.24.3
pkgrel=1
pkgdesc='A kubectl plugin, which allows you to convert manifests between different API versions'
url='https://kubernetes.io/docs/tasks/tools/included/kubectl-convert-overview/'
source=("kubectl-convert.bin::https://dl.k8s.io/release/v${pkgver}/bin/linux/amd64/kubectl-convert")
license=('Apache')

arch=('x86_64')

b2sums=('2a45209de1b6c170056d01f7db270000a66d60925f029202a411328c8abbe158fc6bbd7c0026d449890ada6ee717b96230d58afec1040a972658ec8401ebc44e')

package() {
  cd "$srcdir"
  install -Dm755 "kubectl-convert.bin" "${pkgdir}/usr/bin/kubectl-convert"
}
