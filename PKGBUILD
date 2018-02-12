# Maintainer: Dennis Oehme <oehme@gardenofconcepts.com>

pkgname=kops-bin
pkgver=1.8.1
_build=${pkgver}
pkgrel=1
pkgdesc='Kubernetes Operations (kops) - Production Grade K8s Installation, Upgrades, and Management'
url='https://github.com/kubernetes/kops'
arch=('x86_64')
license=('apache')
conflicts=()

source_x86_64=("https://github.com/kubernetes/kops/releases/download/${_build}/kops-linux-amd64")
md5sums_x86_64=('2bb3e704854b9541747dc986b41b554f')

package() {
    install -d ${pkgdir}/usr/bin
    install -Dm755 ${srcdir}/kops-linux-amd64 ${pkgdir}/usr/bin/kops
}
