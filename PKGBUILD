# Maintainer: JP Roemer <jp+aur@roemer.im>
# Contributor: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname=saml2aws-bin
_pkgname="${pkgname%-bin}"
pkgver=2.36.13
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
sha256sums_x86_64=('06eff4510cec43c6b424d4d5f4b7477a68a43e18c553096f67336e61d67d3a2e')
sha256sums_aarch64=('a9c9aab4d3f00b888c40a4dc658d3c8b73409b44123534d8356d2daa359e10a9')
sha256sums_armv7h=('5d7f0192466ef85f3096703bbd298392767dd61a0997e60c49a96d777396d40b')
sha256sums_armv6h=('5d7f0192466ef85f3096703bbd298392767dd61a0997e60c49a96d777396d40b')

package() {
    install -Dm 755 "${_pkgname}" -t "${pkgdir}/usr/bin"
}
