# Maintainer: Jordan Klassen <forivall@gmail.com>
# https://github.com/forivall/aur-packages/tree/master/aur/flow-bin

# TODO: create a flow-examples package and add as an optdepend

pkgname=flow-bin
pkgver=0.24.1
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
source=("https://raw.githubusercontent.com/facebook/flow/v${pkgver}/LICENSE")
source_x86_64=("https://github.com/facebook/flow/releases/download/v${pkgver}/flow-linux64-v${pkgver}.zip")
md5sums=('fa1ba6012cf5f9062e5520e7f0b45c16')
md5sums_x86_64=('176fd4400f7567b1f57bfe78937b1140')
noextract=()

package() {
	install -Dm0755 flow/flow "${pkgdir}/usr/bin/flow"
	install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/flow/LICENSE"
}
