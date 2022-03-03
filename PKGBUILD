# Maintainer: JP Roemer <jp+aur@roemer.im>
# Contributor: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname=saml2aws-bin
_pkgname="${pkgname%-bin}"
pkgver=2.34.0
pkgrel=2
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
sha256sums_x86_64=('a3396182237adabf53657fb915dc7d9d5cce01e76d8fb120dd95f7f61272fa9c')
sha256sums_aarch64=('1f8f323ed4676eef59efb0926609a39c9a09247d84c39a540767fad3c7fcb95e')
sha256sums_armv7h=('72dab8c63c3331f5781d4cb53c8aef194f25c872396ad5e99c26101bbf2325e4')
sha256sums_armv6h=('72dab8c63c3331f5781d4cb53c8aef194f25c872396ad5e99c26101bbf2325e4')

package() {
    install -Dm 755 "${_pkgname}" -t "${pkgdir}/usr/bin"
}
