# Maintainer: JP Roemer <jp+aur@roemer.im>
# Contributor: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname=saml2aws-bin
_pkgname="${pkgname%-bin}"
pkgver=2.36.11
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
sha256sums_x86_64=('6824b469d3c2cd86f67545fd27767024ec2a283b8b6c16dedf9a28b2f98019cd')
sha256sums_aarch64=('a889b232b433387c530d3efd8d63dc8c287d72be976e5a340eec3455d530ff3e')
sha256sums_armv7h=('6478812ba1ca9817fcd6e67b116ef8b43091dbb2459094bfeef109c5ec7430d3')
sha256sums_armv6h=('6478812ba1ca9817fcd6e67b116ef8b43091dbb2459094bfeef109c5ec7430d3')

package() {
    install -Dm 755 "${_pkgname}" -t "${pkgdir}/usr/bin"
}
