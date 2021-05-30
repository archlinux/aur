# Maintainer: Brodi <me@brodi.space>
_pkgname=godu
pkgname=${_pkgname}-bin
pkgver=1.3
pkgrel=1
pkgdesc="Simple golang utility helping to discover large files/folders."
url="https://github.com/viktomas/godu"
license=(MIT)
arch=('x86_64')
provides=("${_pkgname}" "${_pkgname}-git")
conflicts=("${_pkgname}" "${_pkgname}-git")

source_x86_64=("$url/releases/download/v$pkgver/${_pkgname}-linux-amd64-${pkgver}.tgz")
source=("https://raw.githubusercontent.com/viktomas/godu/v${pkgver}/LICENSE.md")

sha512sums_x86_64=('324d9bc484ea9e3745ad9be2596db88d8e8ef495b129eb5ff533022e8a511dbc9fad55471c3fa288eb49ed1c713af3961adc350d84744c3a523d9e2de970bdb9')
sha512sums=('a22dc4868e27b5a6b4bfd1dce50fece3c5ee40760252665f6af4a213c714569711226b8e3b6656f2fe871330537b51e6bd84b56891f28e79863ba48d81ff6eed')

package() {
	install -Dm755 godu "${pkgdir}/usr/bin/godu"
	install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
