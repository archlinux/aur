# Maintainer: JP Roemer <jp+aur@roemer.im>
# Contributor: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname=saml2aws-bin
_pkgname="${pkgname%-bin}"
pkgver=2.36.16
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
sha256sums_x86_64=('1e6c4fe5485d47eb7505edae379282881bbedad2fb0facce6a38a66928a9794f')
sha256sums_aarch64=('afe9c45aa4aeba4c60c9aefbdfdf9345dbcf08399af9accac4bd2cabcf97b58c')
sha256sums_armv7h=('77c5029287d217ebaf26ef6aaccfe7f29372f621b962cb656cc52d6d18f4f261')
sha256sums_armv6h=('77c5029287d217ebaf26ef6aaccfe7f29372f621b962cb656cc52d6d18f4f261')

package() {
    install -Dm 755 "${_pkgname}" -t "${pkgdir}/usr/bin"
}
