# Maintainer: Robin Candau <robincandau[at]protonmail[dot]com>
# Contributor: Dimitris Kiziridis <ragouel[at]outlook[dot]com>

pkgname=dnote-server-bin
_pkgname="${pkgname%-bin}"
pkgver=2.0.1
pkgrel=3
pkgdesc="A simple command line notebook for programmers (Server)"
arch=('x86_64' 'aarch64')
url="https://www.getdnote.com/"
license=('AGPL3')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("https://github.com/dnote/dnote/releases/download/server-v${pkgver}/dnote_server_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/dnote/dnote/releases/download/server-v${pkgver}/dnote_server_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('ed10a3a0484c3fce800faa0f786b1656b9edbf66a0aeeb3261053d78496b8077')
sha256sums_aarch64=('0613d5bdaab7cb067420e3b32e5a676ec0b14a071b36014cd646d81c72dbc137')

package() {
	install -Dm 755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm 644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
}
