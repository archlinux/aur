# Maintainer: Emanuele 'Lele aka eldios' Calo' <xeldiosx@gmail.com>

pkgname=kubespy
pkgver=0.5.0
pkgrel=1
pkgdesc="Tools for observing Kubernetes resources in real time"
arch=('x86_64')
url="https://github.com/pulumi/kubespy"
license=('Apache')
depends=('glibc')
source_x86_64=(
    "kubespy::https://github.com/pulumi/kubespy/releases/download/v${pkgver}/kubespy-linux-amd64.tar.gz"
    )
sha256sums_x86_64=(
    '04e3c2d3583e3817e95dfa5041ad97b9fca9d4349f088c3520a233cca16cac55'
    )
options=(!strip)

package() {
    mkdir -p "${pkgdir}/usr/bin"
    install -m755 -t "${pkgdir}/usr/bin/" ${srcdir}/releases/kubespy-linux-amd64/kubespy
}
