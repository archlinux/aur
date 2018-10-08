# Maintainer: Emanuele 'Lele aka eldios' Calo' <xeldiosx@gmail.com>

pkgname=kubespy
pkgver=0.4.0
pkgrel=1
pkgdesc="Tools for observing Kubernetes resources in real time"
arch=('x86_64')
url="https://github.com/pulumi/kubespy"
license=('Apache')
depends=('glibc')
source_x86_64=(
    "kubespy::https://github.com/pulumi/kubespy/releases/download/v${pkgver}/kubespy_linux-amd64"
    )
sha256sums_x86_64=(
    'ea9c213760454f374c0c508b1a25cfabaaeca983a000b453cf328ca50ed0e997'
    )
options=(!strip)

package() {
    mkdir -p "${pkgdir}/usr/bin"
    install -m755 -t "${pkgdir}/usr/bin/" kubespy
}

