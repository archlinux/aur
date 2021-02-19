# Maintainer: Emanuele 'Lele aka eldios' Calo' <xeldiosx@gmail.com>

pkgname=kubespy
pkgver=0.6.0
pkgrel=1
pkgdesc="Tools for observing Kubernetes resources in real time"
arch=('x86_64')
url="https://github.com/pulumi/kubespy"
license=('Apache')
depends=('glibc')
source_x86_64=(
    "kubespy::https://github.com/pulumi/kubespy/releases/download/v${pkgver}/kubespy-v${pkgver}-linux-amd64.tar.gz"
)
sha256sums_x86_64=(
    'ef3c8aa133abd6a160692d9381932017b7e2511d2dbb124af0eaea5148f4776e'
)
options=(!strip)

package() {
    mkdir -p "${pkgdir}/usr/bin"
    install -m755 -t "${pkgdir}/usr/bin/" ${srcdir}/kubespy
}
