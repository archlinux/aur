# Maintainer: Dennis Oehme <oehme@gardenofconcepts.com>

pkgname=kops-bin
pkgver=1.10.1
_build=${pkgver}
pkgrel=1
pkgdesc='Kubernetes Operations (kops) - Production Grade K8s Installation, Upgrades, and Management'
url='https://github.com/kubernetes/kops'
arch=('x86_64')
license=('apache')
conflicts=()

source_x86_64=("$pkgname-$pkgver::https://github.com/kubernetes/kops/releases/download/${_build}/kops-linux-amd64")
md5sums_x86_64=('f9fc89c7d935873e9d4510d2f33726cf')

package() {
    install -d ${pkgdir}/usr/bin
    install -Dm755 ${srcdir}/$pkgname-$pkgver ${pkgdir}/usr/bin/kops
}
