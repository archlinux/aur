# Maintainer: Matsaa93 <matsaa93@gmail.com>
pkgname=sddm_theme_selector
_pkgname=sddm_theme_selector
pkgver=1.1.0
pkgrel=1

pkgdesc="a script that lets you shange Sddm Theme"
arch=("any")
url="https://github.com/matsaa93/uni-sync-timer"
license=('GPL2')
depends=("zenity" "zsh")
makedepends=("git")
checkdepends=()
provides=("${pkgname}")
options=(!strip)
validpgpkeys=(A90CF879EC922C4751F26A61258971F7992C02F6)
source=("LICENSE" "sddm_theme_selector.desktop" "sddm_theme_selector.sh")
noextract=()
sha256sums=('8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643'
	    '34dda4240fb314d8f07130946001d34a794483a345f2fcfe6087602ed046319c'
	    '60e86c12c05b68e00c8bed2dcf2d763cef04c91f1ee422365ecb52051a78b6c8')

package() {
	cd "$srcdir"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 ${pkgname}.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm755 ${pkgname}.sh "${pkgdir}/usr/bin/${pkgname}"
}
