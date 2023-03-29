# Maintainer: JP Roemer <jp+aur@roemer.im>
# Contributor: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname=saml2aws-bin
_pkgname="${pkgname%-bin}"
pkgver=2.36.6
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
sha256sums_x86_64=('9763defd7b90d79a32b9a4b7c9ae4effced5f373127096693afecc023a13c4df')
sha256sums_aarch64=('e62e3e8c76b39a599da052a3f8c93ccf228843fab960ef89cbd299e18146d047')
sha256sums_armv7h=('af4aa4ba5e3804df07c888e11bfe62d244d56e1ff95b01da4857570eda0307e4')
sha256sums_armv6h=('af4aa4ba5e3804df07c888e11bfe62d244d56e1ff95b01da4857570eda0307e4')

package() {
    install -Dm 755 "${_pkgname}" -t "${pkgdir}/usr/bin"
}
