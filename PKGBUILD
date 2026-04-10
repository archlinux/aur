# Maintainer: Gabriel M. Dutra <gabrieldutra@tutanota.com>

pkgname=kubespy
pkgver=0.6.3
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
    'a1e9a38fd9afddeaec6c5c992aee8cb9ddaeabf9d6f122241754426a79d9b86e'
)
options=(!strip)

package() {
    mkdir -p "${pkgdir}/usr/bin"
    install -m755 -t "${pkgdir}/usr/bin/" ${srcdir}/kubespy
}
