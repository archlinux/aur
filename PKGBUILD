# Maintainer: JP Roemer <jp+aur@roemer.im>
# Contributor: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname=saml2aws-bin
_pkgname="${pkgname%-bin}"
pkgver=2.36.5
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
sha256sums_x86_64=('259b764df914ffb09bd43adffe39ab59f378055dcce7b658e5add08194983334')
sha256sums_aarch64=('8e4fda2ee1f5c5c93a2d5691e4a955279ac7cd1a52cca2055cdc4b992b134c0b')
sha256sums_armv7h=('f645fc87ff5ba2e5f4123fdb813929ca50ccd0d4a1126876491fd01575f6fbf1')
sha256sums_armv6h=('f645fc87ff5ba2e5f4123fdb813929ca50ccd0d4a1126876491fd01575f6fbf1')

package() {
    install -Dm 755 "${_pkgname}" -t "${pkgdir}/usr/bin"
}
