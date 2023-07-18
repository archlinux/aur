# Maintainer: JP Roemer <jp+aur@roemer.im>
# Contributor: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname=saml2aws-bin
_pkgname="${pkgname%-bin}"
pkgver=2.36.10
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
sha256sums_x86_64=('48cc05bcdd50a6d044d7b06475b6f309ced6e489d4cfd1cc2c8f3a911da20585')
sha256sums_aarch64=('711dd76b5fbb166c31f023500175136f798980dfd3351ce319e2f9187ac4a77f')
sha256sums_armv7h=('5cf0135b0549172c07f1a718def23319929073cf1bbe002179f28d74697fe010')
sha256sums_armv6h=('5cf0135b0549172c07f1a718def23319929073cf1bbe002179f28d74697fe010')

package() {
    install -Dm 755 "${_pkgname}" -t "${pkgdir}/usr/bin"
}
