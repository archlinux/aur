# Maintainer: Jordan Klassen <forivall@gmail.com>
# https://github.com/forivall/aur-packages/tree/master/aur/flow-bin

# TODO: create a flow-examples package and add as an optdepend

pkgname=flow-bin
pkgver=0.39.0
pkgrel=1
epoch=
pkgdesc="Adds static typing to JavaScript to improve developer productivity and code quality"
arch=('x86_64')
url="http://flowtype.org/"
license=('BSD')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=('flow')
conflicts=('flow')
replaces=('flow')
backup=()
options=()
install=
changelog=
source=(
	"https://github.com/facebook/flow/releases/download/v${pkgver}/flow-linux64-v${pkgver}.zip"
	"https://raw.githubusercontent.com/facebook/flow/v${pkgver}/LICENSE"
)
sha256sums=(
	'0f81d8721534aa890bb4367a48fce153dd9dfd058afed90a24c50348c65b9424'
	'7e143b7118d0d0d294ecac71a0dcf24275f3f9cc7a74a157a121ea18ec085114'
)

package() {
	install -Dm0755 flow/flow "${pkgdir}/usr/bin/flow"
	install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/flow/LICENSE"
}
