# Maintainer: Valerio Pizzi (pival81) <pival81@yahoo.com>
# Comaintainer: Cristian Pozzessere (ilnanny) <ilnannyhack@gmail.com>

pkgname=lila-hd
_gitname=Lila-HD-icon-theme
pkgver=r66.d8dd052
pkgrel=1
pkgdesc="Lila HD icon theme for Gnu-Linux and Unix-like O.S"
arch=(any)
url="https://github.com/ilnanny/Lila-HD-icon-theme"
options=(!strip)
license=('CC BY-SA 4.0')
depends=('gtk-update-icon-cache')
makedepends=('git')
source=("git://github.com/ilnanny/${_gitname}.git")
md5sums=('SKIP')

pkgver() {
	cd "${_gitname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	mkdir -p "${pkgdir}/usr/share/icons/"
	cd "${srcdir}/${_gitname}"
	cp -r Lila_HD  "${pkgdir}/usr/share/icons/"
	echo "Copied 'Lila_HD', 20%"
	cp -r Lila_HD_Blue "${pkgdir}/usr/share/icons/"
	echo "Copied 'Lila_HD_Blue', 40%"
	cp -r Lila_HD_Dark "${pkgdir}/usr/share/icons/"
	echo "Copied 'Lila_HD_Dark', 60%"
	cp -r Lila_HD_Green "${pkgdir}/usr/share/icons/"
	echo "Copied 'Lila_HD_Dark', 80%"
	cp -r Lila_HD_Kaki "${pkgdir}/usr/share/icons/"
	echo "Copied 'Lila_HD_Kaki', 100%"
}


