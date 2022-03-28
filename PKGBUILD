# Maintainer: Brittany Figueroa <dormwear underscore iure at crowley dot seership dot dev>

pkgname=goi18n-bin
_pkgname="${pkgname%-bin}"
pkgver=2.2.0
pkgrel=1
pkgdesc='CLI tool that manages message files used by the i18n package'
arch=('x86_64')
_goos='linux'
_goarch='amd64'
url="https://github.com/nicksnyder/${_pkgname/go/go-}"
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${pkgname}-${pkgver}"::"${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-${_goos}-${_goarch}")
b2sums=('b9322ed9da42bcdec93c1ce1b057ac0484cc8f37325d6346e78ad8312246b2b862cc338c1a98d40e1c47f52dec39b761c5fb381a285f2edf3e377ffc59961f0c')

package() {
	install -D --mode 755 "${pkgname}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"
}
