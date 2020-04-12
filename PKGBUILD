# Maintainer: Emanuele 'Lele aka eldios' Calo' <xeldiosx@gmail.com>

pkgname=kubespy
pkgver=0.5.1
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
    'e86b18e77f8d5a5f944213e810eff3815cc117a99c5d8f4d5b1691bea6a51de0'
)
options=(!strip)

package() {
    mkdir -p "${pkgdir}/usr/bin"
    install -m755 -t "${pkgdir}/usr/bin/" ${srcdir}/releases/kubespy-linux-amd64/kubespy
}
