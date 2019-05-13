# Maintainer: Emanuele 'Lele aka eldios' Calo' <xeldiosx@gmail.com>

pkgname=linkerd
pkgver=2.3.0
pkgrel=2
pkgdesc="A service sidecar for Kubernetes and beyond. Main repo for Linkerd 2.x.  - https://linkerd.io"
arch=('x86_64')
url="https://linkerd.io/2/getting-started/"
license=('Apache')
depends=('glibc')
source_x86_64=(
    "linkerd::https://github.com/linkerd/linkerd2/releases/download/stable-${pkgver}/linkerd2-cli-stable-${pkgver}-linux"
    )
sha256sums_x86_64=(
    '82bbd4e994231d0cb7532144851c84a5ce84811468e1eb7ceeebd21aec1d98fa'
    )
options=(!strip)

package() {
    mkdir -p "${pkgdir}/usr/bin"
    install -m755 -t "${pkgdir}/usr/bin/" linkerd
}

