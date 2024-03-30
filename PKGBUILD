# Maintainer: JP Roemer <jp+aur@roemer.im>
# Contributor: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname=saml2aws-bin
_pkgname="${pkgname%-bin}"
pkgver=2.36.15
pkgrel=1
pkgdesc='CLI tool which enables you to login and retrieve AWS temporary credentials using a SAML IDP'
arch=('x86_64' 'aarch64' 'armv7h' 'armv6h')
url="https://github.com/Versent/saml2aws"
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("${url}/releases/download/v$pkgver/${_pkgname}_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${url}/releases/download/v$pkgver/${_pkgname}_${pkgver}_linux_arm64.tar.gz")
source_armv7h=("${url}/releases/download/v$pkgver/${_pkgname}_${pkgver}_linux_armv6.tar.gz")
source_armv6h=("${url}/releases/download/v$pkgver/${_pkgname}_${pkgver}_linux_armv6.tar.gz")
sha256sums_x86_64=('938ea3b154a1656d6d2bd245a0d0f1a89970241e8af2da7fe8c18832a0af8539')
sha256sums_aarch64=('e3600b4db1a9ef2e698304e77b8b41d059d21787eb95a468b5ae377ec1b419da')
sha256sums_armv7h=('8c9299bc8aa7f41dc4522d981acd8f2377939e9877f4a66f9f3fac3f3db25de4')
sha256sums_armv6h=('8c9299bc8aa7f41dc4522d981acd8f2377939e9877f4a66f9f3fac3f3db25de4')

package() {
    install -Dm 755 "${_pkgname}" -t "${pkgdir}/usr/bin"
}
