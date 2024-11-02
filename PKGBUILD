# Maintainer: Anes Belfodil <ans.belfodil@gmail.com>
pkgname=mems-studio
pkgver=1.4.1
pkgrel=1
epoch=
pkgdesc="Software solution for MEMS sensors with graphical no-code design of algorithms and development of embedded AI features."
arch=('x86_64')
url="https://www.st.com/en/development-tools/mems-studio.html"
license=('LGPL')
groups=()
depends=()
makedepends=('dpkg')
checkdepends=()
optdepends=()
provides=('mems-studio')
conflicts=()
replaces=()
backup=()
options=('!strip' '!emptydirs')
install=
changelog=
source=("local://${pkgname}_${pkgver}_amd64.deb")
noextract=()
sha256sums=('5cb9b5e8287c393d268b7139996e161510f50922867a341fc849996927bda1b7')
validpgpkeys=()

package() {
	dpkg -x ${pkgname}_${pkgver}_amd64.deb "${pkgdir}"
}
