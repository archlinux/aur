# Maintainer: Yurii Kolesnykov <root@yurikoles.com>
# Contributor: Grzegorz Chodzicki <grzegorz.chodzicki AT protonmail DOT com>

pkgname='virtualbox-unattended-templates'
pkgver=7.0.8
pkgrel=1
pkgdesc='Unattended Templates for Virtualbox'
url='https://www.virtualbox.org/'
arch=('x86_64')
license=('GPL3')
optdepends=('virtualbox')
source=("https://download.virtualbox.org/virtualbox/${pkgver}/VirtualBox-${pkgver}.tar.bz2")
sha256sums=('c305fbe480f507eac7c36893ead66dffaacda944f19c3813a4533e9c39bae237')

package() {
	local share_vbox="${pkgdir}"/usr/share/virtualbox
	mkdir -p "${share_vbox}"
	cp -R VirtualBox-${pkgver}/src/VBox/Main/UnattendedTemplates "${share_vbox}"
}
