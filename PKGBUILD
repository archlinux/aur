# Maintainer: JP Roemer <jp+aur@roemer.im>
# Contributor: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname=saml2aws-bin
_pkgname="${pkgname%-bin}"
pkgver=2.36.18
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
sha256sums_x86_64=('57cb099cff2c9d8526a579a0c5668be76a481905199cf99df5976a96124bb17f')
sha256sums_aarch64=('010e97f95af20774a1b4f1efbe498c044de08b3a1cebafbd956fdeec7399d9c2')
sha256sums_armv7h=('acb6eacef668ca03fa82aee2d3ac3f02a1ccd4eb1ffcadc4de748d7f44654b88')
sha256sums_armv6h=('acb6eacef668ca03fa82aee2d3ac3f02a1ccd4eb1ffcadc4de748d7f44654b88')

package() {
    install -Dm 755 "${_pkgname}" -t "${pkgdir}/usr/bin"
}
