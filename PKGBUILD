# Maintainer: Christian Hesse <arch@eworm.de>
# Contributor: mattia.b89 <mattia DOT b89 AT gmail DOT com>
# Contributor: Devin Cofer <ranguvar{AT]archlinux[DOT}us>
# Contributor: Shae Smittle <starfall87@gmail.com>

pkgname=gnome-colors-icon-theme-extras
pkgver=5.5.1
pkgrel=3
pkgdesc='Extra icons for GNOME-Colors icon theme'
arch=('any')
url='http://gnome-colors.googlecode.com/'
license=('GPL2')
depends=('gnome-colors-icon-theme')
source=("http://gnome-colors.googlecode.com/files/gnome-colors-extras-${pkgver}.tar.gz")
sha256sums=('5f9740b74f5069a05482798a3243ea66f934894ea9dcb288c610801f1f9411d9')

package() {
	cd "${srcdir}"

	make DESTDIR="${pkgdir}"/ install
}

