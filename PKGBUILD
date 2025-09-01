# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=certificate-ripper-bin
_pkgname="${pkgname%-bin}"
_shortname=crip
pkgver=2.5.0
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
sha256sums_x86_64=('c1178e1470af2901c9b01041c5433cc7a357c031c549472982ab118de677253b')
sha256sums_aarch64=('167fd40477134edca7c574b79f2959a47785bc6e0e991623e98ba4855f6ba43d')

package() {
	install -Dm 755 "${_shortname}" "${pkgdir}/usr/bin/${_shortname}"
}
