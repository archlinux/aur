# Maintainer: Andrei Dobre <andreidobre at gmail dot com>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Giacomo Longo <gabibbo97@gmail.com>

pkgname=kubebuilder
pkgver=3.1.0
pkgrel=1
pkgdesc="SDK for building Kubernetes APIs"
url="https://github.com/kubernetes-sigs/kubebuilder"
license=('APACHE')
source=("https://github.com/kubernetes-sigs/kubebuilder/releases/download/v${pkgver}/kubebuilder_linux_amd64")
sha256sums=('a4af6a2110cf506855cdc86d0291c6e76203ae9fb3c918f7fdc05e7962e4b488')
arch=('x86_64')

package() {
  install -Dm755 "${srcdir}/kubebuilder_linux_amd64" "${pkgdir}/usr/bin/kubebuilder"
}
