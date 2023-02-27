# Maintainer: JP Roemer <jp+aur@roemer.im>
# Contributor: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname=saml2aws-bin
_pkgname="${pkgname%-bin}"
pkgver=2.36.4
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
sha256sums_x86_64=('e14d95126b48fc72d8dbd72ac215aa23b57eaf80f3f6d72ec75ada32bc1d695c')
sha256sums_aarch64=('655d9286636748cdb1741c82a5e362c861804bc03987c811f4eb05f9fe732833')
sha256sums_armv7h=('6d4d37d1148abde815653193b2af8bcdc051ddea14d1626f8212b3cfff743ed0')
sha256sums_armv6h=('6d4d37d1148abde815653193b2af8bcdc051ddea14d1626f8212b3cfff743ed0')

package() {
    install -Dm 755 "${_pkgname}" -t "${pkgdir}/usr/bin"
}
