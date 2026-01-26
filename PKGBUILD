# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=certificate-ripper-bin
_pkgname="${pkgname%-bin}"
_shortname=crip
pkgver=2.7.0
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
sha256sums_x86_64=('a2480e7ba47b3353a605196c69126b73489905b89dac3bbc9c8c8edfd23164b6')
sha256sums_aarch64=('0a0778aace3f9f18d79b9f0a3603d04c9a0fe599364c16cf0add4b574120c9b6')

package() {
	install -Dm 755 "${_shortname}" "${pkgdir}/usr/bin/${_shortname}"
}
