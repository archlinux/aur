# Maintainer: JP Roemer <jp+aur@roemer.im>
# Contributor: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname=saml2aws-bin
_pkgname="${pkgname%-bin}"
pkgver=2.36.3
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
sha256sums_x86_64=('6f4388dc80f26f375b4c39957a76e6a90c1f93c625959fc04df6bf65a68031ca')
sha256sums_aarch64=('25c9b1a04ec693ec925c274c35ac24aa1beb00e28c6a9f888132d84598ad8a3f')
sha256sums_armv7h=('839db99bc919d2aa47412914dad590f0f37226c7e48599fcaf1cb8125c920d9b')
sha256sums_armv6h=('839db99bc919d2aa47412914dad590f0f37226c7e48599fcaf1cb8125c920d9b')

package() {
    install -Dm 755 "${_pkgname}" -t "${pkgdir}/usr/bin"
}
