# Maintainer: Nil Geisweiller <ngeiswei at the giant g>

pkgname=ctrlr-anderseriksson-roland-d50-panel
pkgver=1.2
pkgrel=3
epoch=
pkgdesc="Ctrlr panel from Anders Eriksson (meastempo) for the Roland D-50, installed under /usr/share/ctrlr/panel/AndersEriksson."
arch=('any')
url="https://ctrlr.org/roland-d50-editor/"
license=()
groups=('pro-audio')
depends=('ctrlr')
makedepends=()
checkdepends=()
optdepends=()
provides=('ctrlr-anderseriksson-roland-d50-panel')
conflicts=('ctrlr-anderseriksson-roland-d50-panel')
replaces=()
backup=()
options=()
install=
changelog=
source=("D50-editor-${pkgver}.bpanelz"::"https://ctrlr.org/wp-content/uploads/delightful-downloads/2017/02/D50-editor-${pkgver}.bpanelz")
noextract=()
sha256sums=('SKIP')
validpgpkeys=()

package() {
	PREFIX="${pkgdir}/usr"
	SHAREPATH="${PREFIX}/share"
	PANELSPATH="${SHAREPATH}/ctrlr/panels"
	ANDERSPATH="${PANELSPATH}/AndersEriksson"

	# Create local folders and copy panels
	mkdir -p "${ANDERSPATH}"
	cp "D50-editor-${pkgver}.bpanelz" "${ANDERSPATH}"
}
