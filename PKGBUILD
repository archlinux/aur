# Maintainer: Enmanuel Moreira <enmanuelmoreira@gmail.com>

_pkgname=kube-burner

pkgname=kube-burner-bin
pkgver=1.9.4
pkgrel=1
pkgdesc='Kube-burner is a tool aimed at stressing Kubernetes clusters by creating or deleting a high quantity of objects.'
arch=('x86_64')
url='https://github.com/cloud-bulldozer/kube-burner'
license=('Apache 2')
provides=('kube-burner-bin')
source=("https://github.com/cloud-bulldozer/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-V${pkgver}-Linux-x86_64.tar.gz")
sha256sums=('8eaf1e82526b66e5c9d130fdfc415a10704beddf246b1fed57185ab8e3e69c22')

package() {
    mkdir -p "${pkgdir}/usr/bin"
    install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 LICENSE ${pkgdir}/usr/share/doc/${pkgname}/LICENSE
}
