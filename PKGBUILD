# Maintainer: Gus deMayo <gus.demayo@gmail.com>

pkgname="desktop-dimmer"
fullpkgname="Desktop Dimmer"
pkgver=2.2.0
pkgrel=1
pkgdesc="Enables darker-than-dark Desktop dimming for your displays."
arch=("x86_64")
url="https://github.com/sidneys/${pkgname}"
license=("MIT")
source=("https://github.com/sidneys/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.pacman")
md5sums=("CA4C916E7D1C37A1711EE697494A6C30")

package() {
    cd "${srcdir}"
    install -d "${pkgdir}/usr/share/applications"
    install -d "${pkgdir}/usr/share/icons/"
    install -d "${pkgdir}/opt/${fullpkgname}"
    chmod -R go-w "${pkgdir}/usr"
    mkdir -p "${pkgdir}/usr/bin"
    ln -s "/opt/${fullpkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
