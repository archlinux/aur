# Maintainer: Grzegorz Chodzicki <grzegorz.chodzicki AT protonmail DOT com>

pkgname='virtualbox-unattended-templates'
pkgver=6.1.16
pkgrel=1

pkgdesc="Unattended Templates for Virtualbox"
url="https://www.virtualbox.org/"
arch=('x86_64')
license=('GPL2')

optdepends=('virtualbox')

source=("https://download.virtualbox.org/virtualbox/${pkgver}/VirtualBox-${pkgver}.tar.bz2")
sha256sums=('49c1990da16d8a3d5bda8cdb961ec8195a901e67e4c79aea44c1521a5fc2f9f1')

package() {
	cd "$srcdir"
	mkdir -p ${pkgdir}/usr/share/virtualbox
	cp -R VirtualBox-${pkgver}/src/VBox/Main/UnattendedTemplates ${pkgdir}/usr/share/virtualbox
}
