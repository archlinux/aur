# Maintainer: Robin Candau <robincandau[at]protonmail[dot]com>

pkgname=certificate-ripper-bin
_pkgname="${pkgname%-bin}"
_shortname=crip
pkgver=2.1.0
pkgrel=2
pkgdesc="A CLI tool to extract server certificates"
arch=('x86_64' 'aarch64')
url="https://github.com/Hakky54/certificate-ripper"
license=('Apache')
depends=('zlib')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("${_shortname}-${pkgver}-amd64.tar.gz::${url}/releases/download/${pkgver}/${_shortname}-linux-amd64.tar.gz")
source_aarch64=("${_shortname}-${pkgver}-aarch64.tar.gz::${url}/releases/download/${pkgver}/${_shortname}-linux-aarch64.tar.gz")
sha256sums_x86_64=('a857e35e2f4adc8b424a14353e39fa7a1b3e19a4f1359b198944abf908296c8c')
sha256sums_aarch64=('b72867b24d3d2c7fd9811c7d7486a1a43334412339f004eac52ebc2dc5b93509')

package() {
	install -Dm 755 "${_shortname}" "${pkgdir}/usr/bin/${_shortname}"
}
