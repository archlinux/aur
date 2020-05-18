# Maintainer: Emanuele 'Lele aka eldios' Calo' <xeldiosx@gmail.com>

pkgname=linkerd
pkgver=2.7.1
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
    '010a1f94eacbb8730023be47fb31c4dd316a78d4bc4b98cb9c9180a9bbc7a26e'
    )
options=(!strip)

package() {
    mkdir -p "${pkgdir}/usr/bin"
    install -m755 -t "${pkgdir}/usr/bin/" linkerd
}

