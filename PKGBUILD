# Maintainer: JP Roemer <jp+aur@roemer.im>
# Contributor: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname=saml2aws-bin
_pkgname="${pkgname%-bin}"
pkgver=2.36.19
pkgrel=1
pkgdesc='CLI tool which enables you to login and retrieve AWS temporary credentials using a SAML IDP'
arch=('x86_64' 'aarch64' 'armv7h' 'armv6h')
url="https://github.com/Versent/saml2aws"
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
install="install"
source_x86_64=("${url}/releases/download/v$pkgver/${_pkgname}_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${url}/releases/download/v$pkgver/${_pkgname}_${pkgver}_linux_arm64.tar.gz")
source_armv7h=("${url}/releases/download/v$pkgver/${_pkgname}_${pkgver}_linux_armv6.tar.gz")
source_armv6h=("${url}/releases/download/v$pkgver/${_pkgname}_${pkgver}_linux_armv6.tar.gz")
sha256sums_x86_64=('891f7d0eb89bb3000aca72f70ef244ea5f24894f33b24143203caa528555ad7f')
sha256sums_aarch64=('b62424836c8ebd41dca312f3385a7ed552b48dafd4c49d47f62bbef428633255')
sha256sums_armv7h=('88d0bc6a5c1039fb6da12281f2cfee106269b9f51ffd001d06d8ed8a305356e4')
sha256sums_armv6h=('88d0bc6a5c1039fb6da12281f2cfee106269b9f51ffd001d06d8ed8a305356e4')

package() {
    install -Dm 755 "${_pkgname}" -t "${pkgdir}/usr/bin"
}
