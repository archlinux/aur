# Maintainer: JP Roemer <jp+aur@roemer.im>
# Contributor: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname=saml2aws-bin
_pkgname="${pkgname%-bin}"
pkgver=2.36.2
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
sha256sums_x86_64=('f415ae8476cf8c3814a74f9377bed5e9eca189a3c6013030cbe709ac45cf2e45')
sha256sums_aarch64=('e403386e519204760fa4352aafa29586bc40d8bf679d4d7e06fcc44c4a207e1e')
sha256sums_armv7h=('219c54b5026b311171ddb724e9d8246eefc882e2b20a4833f9daefb9d3781ee8')
sha256sums_armv6h=('219c54b5026b311171ddb724e9d8246eefc882e2b20a4833f9daefb9d3781ee8')

package() {
    install -Dm 755 "${_pkgname}" -t "${pkgdir}/usr/bin"
}
