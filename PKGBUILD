# Maintainer: Marius Hirt <marius-hirt@web.de>
_pkgname=k8sgpt
pkgname=k8sgpt-bin
pkgver=0.3.37
pkgrel=1
pkgdesc='A tool for scanning your Kubernetes clusters, diagnosing, and triaging issues in simple English.'
arch=('x86_64' 'arm64' 'i386')
url='https://k8sgpt.ai/'
license=('Apache-2.0')
provides=('k8sgpt')
conflicts=('k8sgpt')
source=(
    "${_pkgname}-${pkgver}-${CARCH}.tar.gz::https://github.com/k8sgpt-ai/k8sgpt/releases/download/v${pkgver}/${_pkgname}_Linux_${CARCH}.tar.gz"
)

sha256sums=(
    '70570ac3b4926c7de68d227cce0bbba95932860adee96034eb9b08c916264781'
)

package() {
    install -Dm755 "${srcdir}/${_pkgname}" \
        "${pkgdir}/usr/bin/${_pkgname}"
}
