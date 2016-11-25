# Maintainer: Joel <aullidolunar (at) gmai1 dot c0m >

_themeid=1480097211
_themename=vimix-aurora
_themeurl=1161587
_themeurlfull=https://dl.opendesktop.org/api/files/download/id/1480097211/Vimix-Aurora.tar.xz

pkgname=gtk-theme-${_themename}
pkgver=1
pkgrel=1
pkgdesc="Gnome 3.20 & 3.22 theme based on Vimix Dark by VINCELIUICE."
arch=('any')
url="https://www.gnome-look.org/p/${_themeurl}/"
license=('GPL')
depends=('gtk3>=3.20')
source=(${_themename}.tar.xz::https://dl.opendesktop.org/api/files/download?id=${_themeid})
sha256sums=('0fad91f24c6e4cefb8c87d735678bad3a50a3dee5ff76e7a599b52fb4b37e087')

package() {
	cd "${srcdir}"
	find . -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
