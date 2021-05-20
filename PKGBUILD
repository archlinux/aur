# Maintainer: Andrei Dobre <andreidobre at gmail dot com>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Giacomo Longo <gabibbo97@gmail.com>

pkgname=kubebuilder
pkgver=3.0.0
pkgrel=1
pkgdesc="SDK for building Kubernetes APIs"
url="https://github.com/kubernetes-sigs/kubebuilder"
license=('APACHE')
source=("https://github.com/kubernetes-sigs/kubebuilder/releases/download/v${pkgver}/kubebuilder_linux_amd64")
sha256sums=('d762c5cd954f9eb8620c64d27fc413e383e8100108d9edaee2211457165d2dff')
arch=('x86_64')

package() {
  install -Dm755 "${srcdir}/kubebuilder_linux_amd64" "${pkgdir}/usr/bin/kubebuilder"
}
