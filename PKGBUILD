# Maintainer: Yurii Kolesnykov <root@yurikoles.com>
# Contributor: Grzegorz Chodzicki <grzegorz.chodzicki AT protonmail DOT com>

pkgname='virtualbox-unattended-templates'
pkgver=7.0.4
pkgrel=1
pkgdesc='Unattended Templates for Virtualbox'
url='https://www.virtualbox.org/'
arch=('x86_64')
license=('GPL3')
optdepends=('virtualbox')
source=("https://download.virtualbox.org/virtualbox/${pkgver}/VirtualBox-${pkgver}.tar.bz2")
sha256sums=('58951f7d1bcda836c5e50ca0a6b13f0e61a07a904f476526a831df3d9bfe5b17')

package() {
	local share_vbox="${pkgdir}"/usr/share/virtualbox
	mkdir -p "${share_vbox}"
	cp -R VirtualBox-${pkgver}/src/VBox/Main/UnattendedTemplates "${share_vbox}"
}
