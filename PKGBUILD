# Maintainer: Emanuele 'Lele aka eldios' Calo' <xeldiosx@gmail.com>

pkgname=linkerd
pkgver=2.6.1
pkgrel=0
pkgdesc="A service sidecar for Kubernetes and beyond. Main repo for Linkerd 2.x.  - https://linkerd.io"
arch=('x86_64')
url="https://linkerd.io/2/getting-started/"
license=('Apache')
depends=('glibc')
source_x86_64=(
    "linkerd::https://github.com/linkerd/linkerd2/releases/download/stable-${pkgver}/linkerd2-cli-stable-${pkgver}-linux"
    )
sha256sums_x86_64=(
    '91f9cee0d4d040df25f05e685d6b581bc207525944e37f3aaa453e846072da88'
    )
options=(!strip)

package() {
    mkdir -p "${pkgdir}/usr/bin"
    install -m755 -t "${pkgdir}/usr/bin/" linkerd
}

