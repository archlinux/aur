# Maintainer: Brittany Figueroa <dormwear underscore iure at crowley dot seership dot dev>

pkgname=yj-bin
_pkgname="${pkgname%-bin}"
pkgver=5.1.0
pkgrel=1
pkgdesc='CLI to convert between YAML, TOML, JSON, and HCL'
arch=('x86_64')
_goos='linux'
_goarch='amd64'
url="https://github.com/sclevine/${_pkgname}/releases"
license=('Apache')
provides=("${_pkgname}")
conflicts=(
	"${_pkgname}"
	"${_pkgname}-git"
)
source=("${_pkgname}-${pkgver}"::"${url}/download/v${pkgver}/${_pkgname}-${_goos}-${_goarch}")
b2sums=('efa71a2534846069478818d90266e350ae65021bb24661fcc6459cc60a0d81fdd0fe58ac3bf336ba799a6ae73d11405202c066ea54fcdfbb5d106d695bb41adf')

package() {
	install -D --mode 755 "${_pkgname}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"
}
