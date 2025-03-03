# Maintainer: Josephine Pfeiffer <josie@redhat.com>
# Former Maintainer: Enmanuel Moreira <enmanuelmoreira@gmail.com>

_pkgname=kube-burner

pkgname=kube-burner-bin
pkgver=1.14.1
pkgrel=1
pkgdesc='Kubernetes performance and scale test orchestration framework written in golang.'
arch=('x86_64')
url='https://github.com/kube-burner/kube-burner'
license=('Apache 2')
provides=('kube-burner-bin')
source=("https://github.com/kube-burner/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-V${pkgver}-linux-x86_64.tar.gz")
sha256sums=('1486d2aa981d4d7021a8c5e98a3a00af2214f38c6daa6961630cbda28fb249c3')

package() {
    mkdir -p "${pkgdir}/usr/bin"
    install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 LICENSE ${pkgdir}/usr/share/doc/${pkgname}/LICENSE
}
