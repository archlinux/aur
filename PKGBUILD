# Maintainer: Marius Hirt <marius-hirt@web.de>
_pkgname=k8sgpt
pkgname=k8sgpt-bin
pkgver=0.3.5
pkgrel=1
pkgdesc='A tool for scanning your Kubernetes clusters, diagnosing, and triaging issues in simple English.'
arch=('x86_64' 'arm64' 'i386')
url='https://k8sgpt.ai/'
license=('Apache')
provides=('k8sgpt')
conflicts=('k8sgpt')
source=(
    "${_pkgname}-${pkgver}-${CARCH}.tar.gz::https://github.com/k8sgpt-ai/k8sgpt/releases/download/v${pkgver}/${_pkgname}_Linux_${CARCH}.tar.gz"
)

sha256sums=(
    '0132a18442a17aa927c5fe40e872deda9772a2854b2c6f299aa77293b57dde46'
)

package() {
    install -Dm644 "${srcdir}/${_pkgname}" \
        "${pkgdir}/usr/bin/${_pkgname}"
}
