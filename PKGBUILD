# Maintainer: Josephine Pfeiffer <josie@redhat.com>
# Contributor: Enmanuel Moreira <enmanuelmoreira@gmail.com>
_pkgname=kube-burner
pkgname=kube-burner-bin
pkgver=2.7.3
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

sha256sums_x86_64=('20407adc462529bbd61c906fe6cd9ab4fa8d550c5d5c437f80c4d6bc494feebe')
sha256sums_aarch64=('0c87745f4d2ce75467efbc6c7f7487689519340cbf4b6c4e07c162515bff6e21')

package() {
    install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
