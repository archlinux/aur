# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=certificate-ripper-bin
_pkgname="${pkgname%-bin}"
_shortname=crip
pkgver=2.4.1
pkgrel=1
pkgdesc="A CLI tool to extract server certificates"
url="https://github.com/Hakky54/certificate-ripper"
arch=('x86_64' 'aarch64')
license=('Apache-2.0')
depends=('zlib')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("${_shortname}-${pkgver}-amd64.tar.gz::${url}/releases/download/${pkgver}/${_shortname}-linux-amd64.tar.gz")
source_aarch64=("${_shortname}-${pkgver}-aarch64.tar.gz::${url}/releases/download/${pkgver}/${_shortname}-linux-aarch64.tar.gz")
sha256sums_x86_64=('7131949d14e9a0c85159c0c59cec767e618ec30226b43c8acb1a0d9f0f33fdeb')
sha256sums_aarch64=('0e3f4cb3f4bf7272dfb969df633ab0a7ad2d5f86e963254d6f8150d9f20c5324')

package() {
	install -Dm 755 "${_shortname}" "${pkgdir}/usr/bin/${_shortname}"
}
