# Maintainer: João Marcos <marcospb19@hotmail.com>

pkgname=corrupter-bin
_pkgname=corrupter
pkgver=1.0
pkgrel=1
pkgdesc='Simple image glitcher for producing nice i3lock backgrounds - Binary version'

arch=('x86_64')
url="https://github.com/r00tman/${_pkgname}"
license=('BSD 2-Clause')

provides=(${_pkgname})
conflicts=(${_pkgname})

source=("${url}/releases/download/v${pkgver}/${_pkgname}_v${pkgver}_x86_64.tar.gz")
md5sums=('04f1c9c324d12717b10c5173a5363f25')

package() {
	install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
