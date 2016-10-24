# Maintainer: Christian Hesse <arch@eworm.de>
# Contributor: BlackICE <manfredi at gmail.com>
# Contributor: jsteel <jsteel at aur.archlinux.org>
# Contributor: Arkham <arkham at archlinux dot us>
# Contributor: Artyom Smirnov <smirnoffjr@gmail.com>
# Contributor: Marius <marius at matamare dot ro>

pkgname=gnome-colors-icon-theme
epoch=1
pkgver=0.r217.g8689d1d
_commit=8689d1d
pkgrel=2
pkgdesc='GNOME-Colors icon theme'
arch=('any')
url='https://github.com/gnome-colors/gnome-colors'
license=('GPL2')
conflicts=('gnome-colors-icon-theme-extras')
replaces=('gnome-colors-icon-theme-extras')
makedepends=('git' 'inkscape')
source=("git://github.com/gnome-colors/gnome-colors.git#commit=${_commit}")
sha256sums=('SKIP')

build() {
	cd "${srcdir}/gnome-colors/gnome-colors/"

	make
}

package() {
	cd "${srcdir}/gnome-colors/gnome-colors/"

	make DESTDIR="${pkgdir}"/ install
}

