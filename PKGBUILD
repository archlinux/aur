# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: mickybart <mickybart@pygoscelis.org>

pkgname=kops-beta-bin
pkgver=1.18.0
_build=${pkgver//_/-}
pkgrel=1
pkgdesc='Kubernetes Operations Beta (kops beta) - Production Grade K8s Installation, Upgrades, and Management'
url='https://github.com/kubernetes/kops'
arch=('x86_64')
license=('apache')
conflicts=('kops-bin')

source=("https://github.com/kubernetes/kops/releases/download/v${_build}/kops-linux-amd64")
sha512sums=('53c34db307a83bb9dab5c4d61dffa0b67fa96db6f5ffef722c7c86d7f3854049d09528291790c930a38e8619de108e10c6baf98fff937a27d7b2cb94fc044a57')

package() {
    install -d ${pkgdir}/usr/bin
    install -Dm755 ${srcdir}/kops-linux-amd64 ${pkgdir}/usr/bin/kops
}

