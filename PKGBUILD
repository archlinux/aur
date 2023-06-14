# Maintainer: JP Roemer <jp+aur@roemer.im>
# Contributor: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname=saml2aws-bin
_pkgname="${pkgname%-bin}"
pkgver=2.36.9
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
sha256sums_x86_64=('da765d7cdb9c10d3b4aa4912dc86c535d5f859782988eb4ceb4eeec74c7b5d88')
sha256sums_aarch64=('f9f88fd2e993650f88d03967604bb3343dabb35783f2cc2b083365ee1786bd8d')
sha256sums_armv7h=('a5a225e7bdd00122bfd61aa6d8e3092f92e7f5cacde686ca2d881a8f5ade1e4e')
sha256sums_armv6h=('a5a225e7bdd00122bfd61aa6d8e3092f92e7f5cacde686ca2d881a8f5ade1e4e')

package() {
    install -Dm 755 "${_pkgname}" -t "${pkgdir}/usr/bin"
}
