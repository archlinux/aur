# Maintainer: JP Roemer <jp+aur@roemer.im>
# Contributor: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname=saml2aws-bin
_pkgname="${pkgname%-bin}"
pkgver=2.36.14
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
sha256sums_x86_64=('d95b0807c5be2c2791ab3916a296deec859651399cc7df7977f422030208ee9d')
sha256sums_aarch64=('f5b45ae44116643ae6a9af4336bc442259d782ae23902ed0aaa1ee1f0c6ef99e')
sha256sums_armv7h=('3798137ed100b7b300846b52e25bd5391ed7f99ba3399b23f960136ae4922206')
sha256sums_armv6h=('3798137ed100b7b300846b52e25bd5391ed7f99ba3399b23f960136ae4922206')

package() {
    install -Dm 755 "${_pkgname}" -t "${pkgdir}/usr/bin"
}
