# Maintainer: Andrei Dobre <andreidobre at gmail dot com>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Giacomo Longo <gabibbo97@gmail.com>

pkgname=kubebuilder-bin
pkgver=3.4.0
pkgrel=1
pkgdesc="SDK for building Kubernetes APIs"
url="https://github.com/kubernetes-sigs/kubebuilder"
license=('APACHE')
conflicts=('kubebuilder')
source=("https://github.com/kubernetes-sigs/kubebuilder/releases/download/v${pkgver}/kubebuilder_linux_amd64")
sha256sums=('cf90dad16d27a9c31db11f2c326aad926036610a75be03f342e28136ae64cf47')
arch=('x86_64')

package() {
  install -Dm755 "${srcdir}/kubebuilder_linux_amd64" "${pkgdir}/usr/bin/kubebuilder"
}
