# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Dimitris Kiziridis <ragouel[at]outlook[dot]com>

pkgname=dnote-server-bin
_pkgname="${pkgname%-bin}"
pkgver=2.1.1
pkgrel=1
pkgdesc="A simple command line notebook for programmers (Server)"
arch=('x86_64' 'aarch64')
url="https://www.getdnote.com/"
license=('AGPL3')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("https://github.com/dnote/dnote/releases/download/server-v${pkgver}/dnote_server_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/dnote/dnote/releases/download/server-v${pkgver}/dnote_server_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('84de96c68900abddd5088a4df2b6b8331b70239baad7cc44cf814788f13ee787')
sha256sums_aarch64=('826eebfef84b0142f3daceb7790f196ec7f32e11a7b9c93163e535f7e7dcadaf')

package() {
	install -Dm 755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm 644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
}
