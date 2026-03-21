# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=certificate-ripper-bin
_pkgname="${pkgname%-bin}"
_shortname=crip
pkgver=2.7.1
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
sha256sums_x86_64=('fa1f26a890df2d1c8b079ae30b26ee40cd2beddbbe1bf332c415dc7793518ba8')
sha256sums_aarch64=('4822cb408ca973bb0c0942796e01182287b828f3165404a67bdc9d1b9f25411d')

package() {
	install -Dm 755 "${_shortname}" "${pkgdir}/usr/bin/${_shortname}"
}
