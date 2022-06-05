# Maintainer: Nil Geisweiller <ngeiswei at the giant g>

pkgname=ctrlr-maurodecarolis-korg-05rw-panel
pkgver=0.99
pkgrel=1
epoch=
pkgdesc="Ctrlr panel from Mauro De Carolis (mdeca) for the Korg 05R/W, installed under /usr/share/ctrlr/panel/MauroDeCarolis."
arch=('any')
url="https://ctrlr.org/korg-05rw-editor/"
license=('GPLv3')
groups=('pro-audio')
depends=('ctrlr')
makedepends=()
checkdepends=()
optdepends=()
provides=('ctrlr-maurodecarolis-korg-05rw-panel')
conflicts=('ctrlr-maurodecarolis-korg-05rw-panel')
replaces=()
backup=()
options=()
install=
changelog=
source=("05RW_0_99_2017-07-15_17-36.bpanelz"::"https://ctrlr.org/wp-content/uploads/delightful-downloads/2017/09/05RW_0_99_2017-07-15_17-36.bpanelz")
noextract=()
sha256sums=('SKIP')
validpgpkeys=()

package() {
	PREFIX="${pkgdir}/usr"
	SHAREPATH="${PREFIX}/share"
	PANELSPATH="${SHAREPATH}/ctrlr/panels"
	AUTHORPATH="${PANELSPATH}/MauroDeCarolis"

	# Create local folders and copy panels
	mkdir -p "${AUTHORPATH}"
	cp "05RW_0_99_2017-07-15_17-36.bpanelz" "${AUTHORPATH}"
}
