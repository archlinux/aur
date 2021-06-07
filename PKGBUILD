# Contributor: Sapphira Armageddos <shadowkyogre.public@gmail.com>
pkgbase=mse-extrafoils
pkgname=("${pkgbase}-clights" "${pkgbase}-fire" "${pkgbase}-fracture" "${pkgbase}-ghost" "${pkgbase}-insanity" "${pkgbase}-jss"  "${pkgbase}-oil" "${pkgbase}-old" "${pkgbase}-parallel" "${pkgbase}-polishedstone" "${pkgbase}-ribbon" "${pkgbase}-ripples")
pkgver=2.0.0
pkgrel=3
pkgdesc="Various extra foils for MSE."
arch=(any)
url="http://msetemps.sourceforge.net/phpBB3/viewtopic.php?&t=144"
license=('GPL')
depends=('magicseteditor')
groups=('mse-addons' 'mse-addons-foils')
source=('https://downloads.sourceforge.net/msetemps/Magic%20-%20Overlays.mse-installer')
sha256sums=('9290cec200846ad9133336a95acb97b5965a024fef9243b47001ba6a8626a09d')

_package-clights() {
	pkgdesc="${pkgdesc} This one is the Christmas Lights object gradient by Art_Freak."
	cd "$srcdir"
	mkdir -p "$pkgdir/usr/share/magicseteditor/data"
	cp -r "magic-overlay-object-${pkgname#${pkgbase}-}.mse-include" "$pkgdir/usr/share/magicseteditor/data"
}

_package-fire() {
	pkgdesc="${pkgdesc} This one is the fire object gradient."
	cd "$srcdir"
	mkdir -p "$pkgdir/usr/share/magicseteditor/data"
	cp -r "magic-overlay-object-${pkgname#${pkgbase}-}.mse-include" "$pkgdir/usr/share/magicseteditor/data"
}

_package-fracture() {
	pkgdesc="${pkgdesc} This one is the fracture foil gradient."
	cd "$srcdir"
	mkdir -p "$pkgdir/usr/share/magicseteditor/data"
	cp -r "magic-overlay-foil-${pkgname#${pkgbase}-}.mse-include" "$pkgdir/usr/share/magicseteditor/data"
}

_package-ghost() {
	pkgdesc="${pkgdesc} This one is the ghost foil gradient by smr1313."
	cd "$srcdir"
	mkdir -p "$pkgdir/usr/share/magicseteditor/data"
	cp -r "magic-overlay-foil-${pkgname#${pkgbase}-}.mse-include" "$pkgdir/usr/share/magicseteditor/data"
}

_package-insanity() {
	pkgdesc="${pkgdesc} This one is the insanity object gradient."
	cd "$srcdir"
	mkdir -p "$pkgdir/usr/share/magicseteditor/data"
	cp -r "magic-overlay-object-${pkgname#${pkgbase}-}.mse-include" "$pkgdir/usr/share/magicseteditor/data"
}

_package-jss() {
	pkgdesc="${pkgdesc} This one is the JSS foil gradient by Art_Freak."
	cd "$srcdir"
	mkdir -p "$pkgdir/usr/share/magicseteditor/data"
	cp -r "magic-overlay-foil-${pkgname#${pkgbase}-}.mse-include" "$pkgdir/usr/share/magicseteditor/data"
}

_package-old() {
	pkgdesc="${pkgdesc} This one is the old foil gradient."
	cd "$srcdir"
	mkdir -p "$pkgdir/usr/share/magicseteditor/data"
	cp -r "magic-overlay-foil-${pkgname#${pkgbase}-}.mse-include" "$pkgdir/usr/share/magicseteditor/data"
}

_package-oil() {
	pkgdesc="${pkgdesc} This one is the oil foil gradient."
	cd "$srcdir"
	mkdir -p "$pkgdir/usr/share/magicseteditor/data"
	cp -r "magic-overlay-foil-${pkgname#${pkgbase}-}.mse-include" "$pkgdir/usr/share/magicseteditor/data"
}

_package-parallel() {
	pkgdesc="${pkgdesc} This one is the parallel foil gradient."
	cd "$srcdir"
	mkdir -p "$pkgdir/usr/share/magicseteditor/data"
	cp -r "magic-overlay-foil-${pkgname#${pkgbase}-}.mse-include" "$pkgdir/usr/share/magicseteditor/data"
}

_package-polishedstone() {
	pkgdesc="${pkgdesc} This one is the polishedstone foil gradient."
	cd "$srcdir"
	mkdir -p "$pkgdir/usr/share/magicseteditor/data"
	cp -r "magic-overlay-foil-${pkgname#${pkgbase}-}.mse-include" "$pkgdir/usr/share/magicseteditor/data"
}

_package-ribbon() {
	pkgdesc="${pkgdesc} This one is the ribbon object gradient."
	conflicts=("${pkgbase}-ribbons")
	replaces=("${pkgbase}-ribbons")

	cd "$srcdir"
	mkdir -p "$pkgdir/usr/share/magicseteditor/data"
	cp -r "magic-overlay-object-${pkgname#${pkgbase}-}.mse-include" "$pkgdir/usr/share/magicseteditor/data"
}

_package-ripples() {
	pkgdesc="${pkgdesc} This one is the ripples foil gradient."

	cd "$srcdir"
	mkdir -p "$pkgdir/usr/share/magicseteditor/data"
	cp -r "magic-overlay-foil-${pkgname#${pkgbase}-}.mse-include" "$pkgdir/usr/share/magicseteditor/data"
}

for _p in ${pkgname[@]};do
  eval "package_${_p}() {
    $(declare -f "_package${_p#${pkgbase}}")
    _package${_p#${pkgbase}}
    }"
done
