# Maintainer: Brokenpip3 <brokenpip3[at]gmail[dot]com>

pkgname=k2tf-bin
_pkgname=k2tf
pkgver=0.7.0
pkgrel=1
pkgdesc="Kubernetes YAML to Terraform HCL converter"
arch=('x86_64')
depends=()
provides=("k2tf")
url="https://github.com/sl1pm4t/k2tf"
license=('Mozilla')
source=("https://github.com/sl1pm4t/k2tf/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_x86_64.tar.gz")
sha256sums=('4031963c77f887caa0105824e943bb508ee955e9f02b381ff9e4b1d817162bd1')

package() {
    install -Dm755 ${srcdir}/k2tf ${pkgdir}/usr/bin/k2tf
    install -Dm755 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/k2tf/LICENSE
}

