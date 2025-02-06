# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=certificate-ripper-bin
_pkgname="${pkgname%-bin}"
_shortname=crip
pkgver=2.4.0
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
sha256sums_x86_64=('ddef084e5f8c59a5436f91db5aba08057e9cb02923e2376f45c593e73cadf6f4')
sha256sums_aarch64=('48f9e679e4fecbc81c303072248d32968b6a1f7ae2a67afb09f1e9fe486cd007')

package() {
	install -Dm 755 "${_shortname}" "${pkgdir}/usr/bin/${_shortname}"
}
