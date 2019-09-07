# Maintainer: robertfoster

pkgname=grub-theme-midna
_pkgname=midna
pkgver=3.1
pkgrel=1
pkgdesc="Midna Grub-theme."
url="http://kaosx.us"
arch=('x86_64')
license=('GPL' 'CC-SA')
depends=('grub-common')
install=grub-themes.install
source=("http://sourceforge.net/projects/kaosx/files/sources/grub-themes/${_pkgname}-${pkgver}.tar.xz")

package() {
	cd ${srcdir}

	install -dm755 ${pkgdir}/usr/share/grub/themes
	cp -dpr --no-preserve=ownership ${_pkgname} ${pkgdir}/usr/share/grub/themes
}
md5sums=('94f772a982a3632ad8957027a9e16c3f')
