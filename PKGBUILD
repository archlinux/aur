# Maintainer: mickybart <mickybart@pygoscelis.org>

pkgname=kops-beta-bin
pkgver=1.15.0_beta.1
_build=${pkgver//_/-}
pkgrel=1
pkgdesc='Kubernetes Operations Beta (kops beta) - Production Grade K8s Installation, Upgrades, and Management'
url='https://github.com/kubernetes/kops'
arch=('x86_64')
license=('apache')
conflicts=('kops-bin')

source_x86_64=("https://github.com/kubernetes/kops/releases/download/${_build}/kops-linux-amd64")
sha512sums_x86_64=('97d7cb7a1a48a2c961d83a67588070791b43b5120bad1cdd6a15a8481d2cd36148c3ba406b113c2c72b6d09a98b87f21e8a12940f304a610b10b5875fb15831b')

package() {
    install -d ${pkgdir}/usr/bin
    install -Dm755 ${srcdir}/kops-linux-amd64 ${pkgdir}/usr/bin/kops
}

