# Maintainer: JP Roemer <jp+aur@roemer.im>
# Contributor: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname=saml2aws-bin
_pkgname="${pkgname%-bin}"
pkgver=2.36.8
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
sha256sums_x86_64=('2be1bf3be7a119e4c00db5877d670a2f18dde7f5623a0a18bad4b1382296b03c')
sha256sums_aarch64=('eb935b2e6c2e704fba3f688a954d919072ad9bbf954b9cb11f86fa44d646e857')
sha256sums_armv7h=('7574f5f6c0cad729d36e38ba81ce5591f9bb21ddd9d9f8f8d39184a707496e66')
sha256sums_armv6h=('7574f5f6c0cad729d36e38ba81ce5591f9bb21ddd9d9f8f8d39184a707496e66')

package() {
    install -Dm 755 "${_pkgname}" -t "${pkgdir}/usr/bin"
}
