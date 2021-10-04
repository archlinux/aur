# Maintainer: Sapphira Armageddos <shadowkyogre.public@gmail.com>
# Maintainer: silverhikari
pkgbase=mse-extrafoils
pkgname=("${pkgbase}-clights" "${pkgbase}-fire" "${pkgbase}-fracture" "${pkgbase}-ghost" "${pkgbase}-insanity" "${pkgbase}-jss"  "${pkgbase}-oil" "${pkgbase}-old" "${pkgbase}-parallel" "${pkgbase}-polishedstone" "${pkgbase}-ribbon" "${pkgbase}-ripples" "${pkgbase}-holes" "${pkgbase}-normal" "${pkgbase}-oldfeed")
pkgver=2.1.2
pkgrel=1
pkgdesc="Various extra foils for MSE."
arch=(any)
url="http://msetemps.sourceforge.net/phpBB3/viewtopic.php?&t=144"
license=('GPL')
depends=('magicseteditor')
groups=('mse-addons' 'mse-addons-foils')
source=('https://github.com/silverhikari/magic-set-templates-aur/raw/main/2.1.2-extrafoils.tar.gz')
sha256sums=('2be5caca81465965cac576375e444a1174c1a116d5e3f5f2c8bb084b72e5b163')

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

_package-normal() {
	pkgdesc="${pkgdesc} This one is the normal foil gradient."

	cd "$srcdir"
	mkdir -p "$pkgdir/usr/share/magicseteditor/data"
	cp -r "magic-overlay-foil-${pkgname#${pkgbase}-}.mse-include" "$pkgdir/usr/share/magicseteditor/data"
}

_package-holes() {
	pkgdesc="${pkgdesc} This one is the holes foil gradient."

	cd "$srcdir"
	mkdir -p "$pkgdir/usr/share/magicseteditor/data"
	cp -r "magic-overlay-foil-${pkgname#${pkgbase}-}.mse-include" "$pkgdir/usr/share/magicseteditor/data"
}

_package-oldfeed() {
	pkgdesc="${pkgdesc} This one is the oldfeed foil gradient."

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
