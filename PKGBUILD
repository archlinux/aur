# Maintainer: Christian Hesse <arch@eworm.de>
# Contributor: BlackICE <manfredi at gmail.com>
# Contributor: jsteel <jsteel at aur.archlinux.org>
# Contributor: Arkham <arkham at archlinux dot us>
# Contributor: Artyom Smirnov <smirnoffjr@gmail.com>
# Contributor: Marius <marius at matamare dot ro>

pkgname=gnome-colors-icon-theme
pkgver=5.5.1
pkgrel=3
pkgdesc='GNOME-Colors icon theme'
arch=('any')
url='http://gnome-colors.googlecode.com'
license=('GPL2')
source=(http://gnome-colors.googlecode.com/files/gnome-colors-$pkgver.tar.gz)
md5sums=('8ec81b556bac351817bd56a1701dbbfb')

package() {
	cd "${srcdir}"

	make DESTDIR="${pkgdir}"/ install
}

