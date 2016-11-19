# Maintainer: Joel <aullidolunar (at) gmai1 dot c0m >

_themeid=1479370833
_themename=vimix-aurora
_themeurl=1161587
_themeurlfull=https://dl.opendesktop.org/api/files/download/id/1479370833/Vimix-Aurora.tar.xz

pkgname=gtk-theme-${_themename}
pkgver=1
pkgrel=0
pkgdesc="Gnome 3.20 & 3.22 theme based on Vimix Dark by VINCELIUICE."
arch=('any')
url="https://www.gnome-look.org/p/${_themeurl}/"
license=('GPL')
depends=('gtk3>=3.20')
source=(${_themename}.tar.xz::https://dl.opendesktop.org/api/files/download?id=${_themeid})
sha256sums=('5fa7c393422619d99524e9ee17b9b592d3d0a7fd4f3fa814983e8df580fe26dc')

package() {
	cd "${srcdir}"
	find . -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
