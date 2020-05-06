# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: mickybart <mickybart@pygoscelis.org>

pkgname=kops-beta-bin
pkgver=1.16.1
_build=${pkgver//_/-}
pkgrel=1
pkgdesc='Kubernetes Operations Beta (kops beta) - Production Grade K8s Installation, Upgrades, and Management'
url='https://github.com/kubernetes/kops'
arch=('x86_64')
license=('apache')
conflicts=('kops-bin')

source=("https://github.com/kubernetes/kops/releases/download/v${_build}/kops-linux-amd64")
sha512sums=('50c198476ac29e2b313e7aacb7d888920210348db9e924aa2a1970d722f71e87a62c0be95d6d6b0e4494190bc9cca7d1f8300586fb2c028260ab4b647d344338')

package() {
    install -d ${pkgdir}/usr/bin
    install -Dm755 ${srcdir}/kops-linux-amd64 ${pkgdir}/usr/bin/kops
}

