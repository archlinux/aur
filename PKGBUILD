# Maintainer: Jordan Klassen <forivall@gmail.com>
# https://github.com/forivall/aur-packages/tree/master/aur/flow-bin

# TODO: create a flow-examples package and add as an optdepend

pkgname=flow-bin
pkgver=0.46.0
pkgrel=1
pkgdesc="Adds static typing to JavaScript to improve developer productivity and code quality"
arch=('x86_64')
url="http://flowtype.org/"
license=('BSD')
provides=('flow')
conflicts=('flow')
replaces=('flow')
source=(
	"https://github.com/facebook/flow/releases/download/v${pkgver}/flow-linux64-v${pkgver}.zip"
	"https://raw.githubusercontent.com/facebook/flow/v${pkgver}/LICENSE"
)
sha256sums=(
	'b683f6700342d6637e5eb40aea9a3fb47dbb48f739209af414fb6fa45bafb1f1'
	'7e143b7118d0d0d294ecac71a0dcf24275f3f9cc7a74a157a121ea18ec085114'
)

package() {
	install -Dm0755 flow/flow "${pkgdir}/usr/bin/flow"
	install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/flow/LICENSE"
}
