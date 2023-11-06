# Maintainer: JP Roemer <jp+aur@roemer.im>
# Contributor: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname=saml2aws-bin
_pkgname="${pkgname%-bin}"
pkgver=2.36.12
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
sha256sums_x86_64=('960451b43d11046090fc23795f71f32e1f81c6edcafe490d31a8f79213149b47')
sha256sums_aarch64=('2d262ce9aeaa5896fe3cf894ca1a6c50ce8a106d6a31b1365b6205a14b78fab1')
sha256sums_armv7h=('eb4d80564c1ba187ebb2e33ae06caea0014693d73c607f67bd6ee7743a7d4362')
sha256sums_armv6h=('eb4d80564c1ba187ebb2e33ae06caea0014693d73c607f67bd6ee7743a7d4362')

package() {
    install -Dm 755 "${_pkgname}" -t "${pkgdir}/usr/bin"
}
