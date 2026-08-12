# Maintainer: Josephine Pfeiffer <josie@redhat.com>
# Contributor: Enmanuel Moreira <enmanuelmoreira@gmail.com>
_pkgname=kube-burner
pkgname=kube-burner-bin
pkgver=2.8.1
pkgrel=4
pkgdesc='Kubernetes performance and scale test orchestration framework'
arch=('x86_64' 'aarch64')
url='https://github.com/kube-burner/kube-burner'
license=('Apache-2.0')
provides=("kube-burner=${pkgver}")
conflicts=('kube-burner')
options=('!strip' '!debug')

source_x86_64=("${_pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/kube-burner/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-V${pkgver}-linux-x86_64.tar.gz")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/kube-burner/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-V${pkgver}-linux-arm64.tar.gz")

sha256sums_x86_64=('afad64159f31dd6cdd8e8886eef2e4992b94ab526aa68d8729b75110a8289a19')
sha256sums_aarch64=('3bc1509980cd5a4512ee43820b4cd2dcf0dd452ec936fe7f90d0c973934c3091')

package() {
    install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
