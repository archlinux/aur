# Maintainer: Enmanuel Moreira <enmanuelmoreira@gmail.com>

_pkgname=kube-burner

pkgname=kube-burner-bin
pkgver=1.7.10
pkgrel=1
pkgdesc='Kube-burner is a tool aimed at stressing Kubernetes clusters by creating or deleting a high quantity of objects.'
arch=('x86_64')
url='https://github.com/cloud-bulldozer/kube-burner'
license=('Apache 2')
provides=('kube-burner-bin')
source=("https://github.com/cloud-bulldozer/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-V${pkgver}-Linux-x86_64.tar.gz")
sha256sums=('81a44cd23db9f322b654bc54f7bccb4720699fa4bd1a146fe3a1c1e1e2fcc72f')

package() {
    mkdir -p "${pkgdir}/usr/bin"
    install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 LICENSE ${pkgdir}/usr/share/doc/${pkgname}/LICENSE
}
