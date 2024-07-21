# Maintainer: JP Roemer <jp+aur@roemer.im>
# Contributor: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname=saml2aws-bin
_pkgname="${pkgname%-bin}"
pkgver=2.36.17
pkgrel=1
pkgdesc='CLI tool which enables you to login and retrieve AWS temporary credentials using a SAML IDP'
arch=('x86_64' 'aarch64' 'armv7h' 'armv6h')
url="https://github.com/Versent/saml2aws"
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
install="install"
source_x86_64=("${url}/releases/download/v$pkgver/${_pkgname}_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${url}/releases/download/v$pkgver/${_pkgname}_${pkgver}_linux_arm64.tar.gz")
source_armv7h=("${url}/releases/download/v$pkgver/${_pkgname}_${pkgver}_linux_armv6.tar.gz")
source_armv6h=("${url}/releases/download/v$pkgver/${_pkgname}_${pkgver}_linux_armv6.tar.gz")
sha256sums_x86_64=('1456fcf57dd35c11cd2d0e1fb5fee6c2a5d25ff8d91c2a89f4e7234fe991fa7b')
sha256sums_aarch64=('f306cdf51f32c78a7689fe9ae288f572be9fb8a3745cc16e483424d21a871dab')
sha256sums_armv7h=('c881f2d8b5362ea2a846206ae006fde6593c2c1c05f12f2a7273962caf872622')
sha256sums_armv6h=('c881f2d8b5362ea2a846206ae006fde6593c2c1c05f12f2a7273962caf872622')

package() {
    install -Dm 755 "${_pkgname}" -t "${pkgdir}/usr/bin"
}
