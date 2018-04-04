# Maintainer: mickybart <mickybart@pygoscelis.org>

pkgname=kops-beta-bin
pkgver=1.9.0_beta.2
_build=${pkgver//_/-}
pkgrel=1
pkgdesc='Kubernetes Operations Beta (kops beta) - Production Grade K8s Installation, Upgrades, and Management'
url='https://github.com/kubernetes/kops'
arch=('x86_64')
license=('apache')
conflicts=('kops-bin')

source_x86_64=("https://github.com/kubernetes/kops/releases/download/${_build}/kops-linux-amd64")
md5sums_x86_64=('7d56d897f3a0d9fff79c16123efcdab1')

package() {
    install -d ${pkgdir}/usr/bin
    install -Dm755 ${srcdir}/kops-linux-amd64 ${pkgdir}/usr/bin/kops
}

