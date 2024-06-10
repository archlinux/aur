# Maintainer: Marius Hirt <marius-hirt@web.de>
_pkgname=k8sgpt
pkgname=k8sgpt-bin
pkgver=0.3.32
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
    '5b5d965dbf6f1b1ea641f070fe77c039f670435f6bd4fb8a9610c6662c159e2b'
)

package() {
    install -Dm644 "${srcdir}/${_pkgname}" \
        "${pkgdir}/usr/bin/${_pkgname}"
}
