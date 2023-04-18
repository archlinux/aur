# Maintainer: Enmanuel Moreira <enmanuelmoreira@gmail.com>

_pkgname=kube-burner

pkgname=kube-burner-bin
pkgver=1.5
pkgrel=1
pkgdesc='Kube-burner is a tool aimed at stressing Kubernetes clusters by creating or deleting a high quantity of objects.'
arch=('x86_64')
url='https://github.com/cloud-bulldozer/kube-burner'
license=('Apache 2')
provides=('kube-burner-bin')
source=("https://github.com/cloud-bulldozer/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-Linux-x86_64.tar.gz")
sha256sums=('e2bebbaa3a7e151155e1053d6102ae6d72d7819fe2b14b6977ca7535fa282f86')

package() {
    mkdir -p "${pkgdir}/usr/bin"
    install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 LICENSE ${pkgdir}/usr/share/doc/${pkgname}/LICENSE
}
