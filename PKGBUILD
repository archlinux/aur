# Maintainer: Brokenpip3 <brokenpip3[at]gmail[dot]com>

pkgname=k2tf-bin
_pkgname=k2tf
pkgver=0.8.0
pkgrel=1
pkgdesc="Kubernetes YAML to Terraform HCL converter"
arch=('x86_64')
depends=()
provides=("k2tf")
url="https://github.com/sl1pm4t/k2tf"
license=('Mozilla')
source=("https://github.com/sl1pm4t/k2tf/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_amd64.tar.gz")
sha256sums=('1d3f6087aed661cb3079b59ada7e4af5dbb6bb236201ea0bf45a20e5016f316d')

package() {
    install -Dm755 ${srcdir}/k2tf ${pkgdir}/usr/bin/k2tf
    install -Dm755 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/k2tf/LICENSE
}
