# Maintainer: JP Roemer <jp+aur@roemer.im>
# Contributor: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname=saml2aws-bin
_pkgname="${pkgname%-bin}"
pkgver=2.36.0
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
sha256sums_x86_64=('4dfc6d1535cac1870527ad8c6a1e0546e1a23ae94fbdaa0aa1163044cc2ad403')
sha256sums_aarch64=('ec8720bde59d9dd1af94ec4347d2c6ee1c125c81aae7405f4ded4367bdeed69c')
sha256sums_armv7h=('8ab3eeefb9fa1550ec039c44c318034f6a44d126f19a3d90c48cd5c604c6e018')
sha256sums_armv6h=('8ab3eeefb9fa1550ec039c44c318034f6a44d126f19a3d90c48cd5c604c6e018')

package() {
    install -Dm 755 "${_pkgname}" -t "${pkgdir}/usr/bin"
}
