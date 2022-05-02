# Maintainer: JP Roemer <jp+aur@roemer.im>
# Contributor: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname=saml2aws-bin
_pkgname="${pkgname%-bin}"
pkgver=2.35.0
pkgrel=1
pkgdesc='CLI tool which enables you to login and retrieve AWS temporary credentials using a SAML IDP'
arch=('x86_64' 'aarch64' 'armv7h' 'armv6h')
url="https://github.com/Versent/${_pkgname}"
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("${url}/releases/download/v$pkgver/${_pkgname}_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${url}/releases/download/v$pkgver/${_pkgname}_${pkgver}_linux_arm64.tar.gz")
source_armv7h=("${url}/releases/download/v$pkgver/${_pkgname}_${pkgver}_linux_armv6.tar.gz")
source_armv6h=("${url}/releases/download/v$pkgver/${_pkgname}_${pkgver}_linux_armv6.tar.gz")
sha256sums_x86_64=('f0ce3113c553f293bc558a9bf3dbc9f49949baadf61d7dd5c79908765ee6cee6')
sha256sums_aarch64=('b1caa4b50debfe4600c702a4f49f5f39be2995bcb4d67c81a545fb080991ea8b')
sha256sums_armv7h=('d940ad41601c4b47255435f505ee335945b1043ffa19c0455118ccda630950a7')
sha256sums_armv6h=('d940ad41601c4b47255435f505ee335945b1043ffa19c0455118ccda630950a7')

package() {
    install -Dm 755 "${_pkgname}" -t "${pkgdir}/usr/bin"
}
