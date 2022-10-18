# Maintainer: JP Roemer <jp+aur@roemer.im>
# Contributor: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname=saml2aws-bin
_pkgname="${pkgname%-bin}"
pkgver=2.36.1
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
sha256sums_x86_64=('f6014091c68e226d2278e79821d34fa8b7e7710c4b603b32fb47727a4f34ad53')
sha256sums_aarch64=('7702e11f07c009b35084d1e165fc531a526634fc3b0d8bfd62ba8360a75ea905')
sha256sums_armv7h=('691770b33605aeed903dcd82cbffa26018ddbe8afcac19ff6d6a50d1ee7b9b43')
sha256sums_armv6h=('691770b33605aeed903dcd82cbffa26018ddbe8afcac19ff6d6a50d1ee7b9b43')

package() {
    install -Dm 755 "${_pkgname}" -t "${pkgdir}/usr/bin"
}
