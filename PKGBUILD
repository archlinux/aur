# Maintainer: Yurii Kolesnykov <root@yurikoles.com>
# Contributor: Grzegorz Chodzicki <grzegorz.chodzicki AT protonmail DOT com>

pkgname='virtualbox-unattended-templates'
pkgver=7.0.6
pkgrel=1
pkgdesc='Unattended Templates for Virtualbox'
url='https://www.virtualbox.org/'
arch=('x86_64')
license=('GPL3')
optdepends=('virtualbox')
source=("https://download.virtualbox.org/virtualbox/${pkgver}/VirtualBox-${pkgver}.tar.bz2")
sha256sums=('f146d9a86a35af0abb010e628636fd800cb476cc2ce82f95b0c0ca876e1756ff')

package() {
	local share_vbox="${pkgdir}"/usr/share/virtualbox
	mkdir -p "${share_vbox}"
	cp -R VirtualBox-${pkgver}/src/VBox/Main/UnattendedTemplates "${share_vbox}"
}
