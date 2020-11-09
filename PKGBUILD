# Maintainer: Brokenpip3 <brokenpip3[at]gmail[dot]com>

pkgname=k2tf-bin
_pkgname=k2tf
pkgver=0.5.0
pkgrel=1
pkgdesc="Kubernetes YAML to Terraform HCL converter"
arch=('x86_64')
depends=()
provides=("k2tf")
url="https://github.com/sl1pm4t/k2tf"
license=('Mozilla')
source=("https://github.com/sl1pm4t/k2tf/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_x86_64.tar.gz")
sha256sums=('1b4b20dc7dbcdc9519f0d093e2cca5b40a5a634a067130a4229b54636c257a9b')

package() {
    install -Dm755 ${srcdir}/k2tf ${pkgdir}/usr/bin/k2tf
    install -Dm755 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/k2tf/LICENSE
}

