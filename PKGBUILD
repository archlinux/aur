# Maintainer: Robin Candau <robincandau[at]protonmail[dot]com>
# Contributor: Jared Meeker <jared[at]meekers[dot]org>
# Contributor: Dimitris Kiziridis <ragouel[at]outlook[dot]com>

pkgname=dnote-cli-bin
_pkgname="${pkgname%-bin}"
_shortname="${_pkgname%-cli}"
pkgver=0.12.0
pkgrel=5
pkgdesc="A simple command line notebook for programmers"
arch=('x86_64' 'aarch64')
url="https://www.getdnote.com/"
license=('GPL3')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("https://github.com/${_shortname}/${_shortname}/releases/download/cli-v${pkgver}/${_shortname}_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/${_shortname}/${_shortname}/releases/download/cli-v${pkgver}/${_shortname}_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('cf769acd15d4a6885181e8bde298487b7c76eddb6afc0fea88fb1642de4c4401')
sha256sums_aarch64=('de3ae3b6ff48699c80b9a689e8d2be47b98ef688bf17ecaec71b394e4085722a')

package() {
	install -Dm 755 "${_shortname}" "${pkgdir}/usr/bin/${_shortname}"
	install -Dm 644 "README.md" "${pkgdir}/usr/share/doc/${_shortname}/README.md"
}
