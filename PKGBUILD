# Maintainer: Ranadeep B < mail at rnbguy dot at >

_pkgname=starport
pkgname=${_pkgname}-bin
pkgver=0.19.1
pkgrel=1
pkgdesc="Starport is the all-in-one platform to build, launch and maintain any crypto application on a sovereign and secured blockchain"
arch=('x86_64')
url="https://${_pkgname}.com"
license=('Apache')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=(
	"https://github.com/tendermint/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.tar.gz"
)
sha256sums=(
	'056a953ea7e9be2194ba32262df3eea90b96a47dea0d4ce2b75cd7b0c1180e67'
)

package() {
	install -Dt "$pkgdir/usr/local/bin" "$_pkgname"
	install -m644 -Dt "$pkgdir/usr/share/licenses/$_pkgname" LICENSE
}
