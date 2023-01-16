# Maintainer: Enmanuel Moreira <enmanuelmoreira@gmail.com>

_pkgname=kubeclarity

pkgname=kubeclarity-cli-bin
pkgver=2.11.0
pkgrel=1
pkgdesc='KubeClarity is a tool for detection and management of Software Bill Of Materials (SBOM) and vulnerabilities of container images and filesystems.'
arch=('x86_64')
url='https://github.com/openclarity/kubeclarity'
license=('Apache 2')
provides=('kubeclarity-cli-bin')
source=("https://github.com/openclarity/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-cli-${pkgver}-linux-amd64.tar.gz")
sha256sums=('0dc54ca6ae67427d3d97a51f0c3207d2a8a73cdce6a894cb9a55bc447fa4b54b')

package() {
    mkdir -p "${pkgdir}/usr/bin"
    install -Dm755 "${srcdir}/${_pkgname}-cli" "${pkgdir}/usr/bin/${_pkgname}-cli"
    install -Dm644 LICENSE ${pkgdir}/usr/share/doc/${pkgname}/LICENSE
}
