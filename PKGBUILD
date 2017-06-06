# Maintainer: Sam Burgos < sam dot burgos1089 at gmail dot com >

pkgname='pop-icon-theme'
_pkgname='system76-pop-icon-theme'
pkgver=1.1.4
pkgrel=1
pkgdesc="System76 Pop Icon Theme"
arch=("any")
url="https://github.com/system76/pop-icon-theme"
license=('GPL2' 'CCPL')
depends=('gtk-update-icon-cache')
provides=('${pkgname}')
conflicts=("pop-icon-theme-git")
source=("https://launchpad.net/~system76-dev/+archive/ubuntu/stable/+files/${_pkgname}_${pkgver}.tar.xz")
sha256sums=("c0302f867a3da6a48778a4f1c9df84bf7ec9c92e12d6e58abbeb96939b9e0889")
optdepends=("pop-gtk-theme: System 76 GTK Theme that completes the set"
            "mint-x-icons: Complementary Icon theme (Inheritance)"
            "breeze-icons: Complementary Icon theme (Inheritance)"
            "adwaita-icon-theme: Complementary Icon theme (Inheritance)")

package() {
  	cd icon-theme
	make DESTDIR="${pkgdir}" install
	make DESTDIR="${pkgdir}" post-install
}
