# Maintainer: colemickens <cole.mickens@gmail.com>

pkgname=kubernetes-cni-bin
pkgdesc="Kubernetes.io kubernetes-cni binary"
pkgver=0.5.1
pkgrel=2
arch=('x86_64')
url="http://kubernetes.io"
license=('apache')
conflicts=('kubernetes')
source_x86_64=(https://packages.cloud.google.com/apt/pool/kubernetes-cni_0.5.1-00_amd64_08cbe5c42366ec3184cc91a4353f6e066f2d7325b4db1cb4f87c7dcc8c0eb620.deb)
sha256sums_x86_64=('08cbe5c42366ec3184cc91a4353f6e066f2d7325b4db1cb4f87c7dcc8c0eb620')

package() {
  tar -vxf data.tar.xz
  install -D -d -m0755"./opt/cni/bin" "${pkgdir}/opt/cni/bin"
}