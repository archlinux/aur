# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Dimitris Kiziridis <ragouel[at]outlook[dot]com>

pkgname=dnote-server-bin
_pkgname="${pkgname%-bin}"
pkgver=3.0.0
pkgrel=1
pkgdesc="A simple command line notebook for programmers (Server)"
arch=('x86_64' 'aarch64')
url="https://www.getdnote.com/"
license=('AGPL3')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("https://github.com/dnote/dnote/releases/download/server-v${pkgver}/dnote_server_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/dnote/dnote/releases/download/server-v${pkgver}/dnote_server_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('f622dee2582c170f6030aef8eea1a0e285ba8527e3f1455fa444f2332d7ad69a')
sha256sums_aarch64=('25cef6fb77c06f3e65c96e6b1e98b5fb3353abe424b2547d9b66774f96f31718')

package() {
	install -Dm 755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm 644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
}
