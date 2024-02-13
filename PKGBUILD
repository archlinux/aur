# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=certificate-ripper-bin
_pkgname="${pkgname%-bin}"
_shortname=crip
pkgver=2.3.0
pkgrel=1
pkgdesc="A CLI tool to extract server certificates"
arch=('x86_64' 'aarch64')
url="https://github.com/Hakky54/certificate-ripper"
license=('Apache-2.0')
depends=('zlib')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("${_shortname}-${pkgver}-amd64.tar.gz::${url}/releases/download/${pkgver}/${_shortname}-linux-amd64.tar.gz")
source_aarch64=("${_shortname}-${pkgver}-aarch64.tar.gz::${url}/releases/download/${pkgver}/${_shortname}-linux-aarch64.tar.gz")
sha256sums_x86_64=('ded3e2edf6665f826dfa241a29ebf765bdff5b7d899c51979ff33dc7b5fd7fa2')
sha256sums_aarch64=('7b4e776d5bd55e6982972a6fee90471992100161b4f324832330c4e996ceaee9')

package() {
	install -Dm 755 "${_shortname}" "${pkgdir}/usr/bin/${_shortname}"
}
