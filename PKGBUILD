# Maintainer: Sam Burgos < sam dot burgos1089 at gmail dot com >

pkgname='pop-icon-theme'
_pkgname='system76-pop-icon-theme'
pkgver=1.0.4
pkgrel=1
pkgdesc="System76 Pop Icon Theme"
arch=("any")
url="https://github.com/system76/pop-icon-theme"
license=("GPL2" "CCPL")
depends=("gtk-update-icon-cache")
provides=("${pkgname}")
conflicts=("pop-icon-theme-git")
source=("https://launchpad.net/~system76-dev/+archive/ubuntu/stable/+files/${_pkgname}_${pkgver}.tar.xz")
sha256sums=("2f7a7405af514e02c1c5e041beb19d2301c01f21ec86cda92fe15a49d350bfef")
optdepends=("pop-gtk-theme: System 76 GTK Theme that completes the set"
            "mint-x-icons: Complementary Icon theme (Inheritance)"
            "breeze-icons: Complementary Icon theme (Inheritance)"
            "adwaita-icon-theme: Complementary Icon theme (Inheritance)")

package() {
  	cd icon-theme
	make DESTDIR="${pkgdir}" install
	make DESTDIR="${pkgdir}" post-install
}