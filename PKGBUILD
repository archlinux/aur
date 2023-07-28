# Maintainer: Yurii Kolesnykov <root@yurikoles.com>
# Contributor: Grzegorz Chodzicki <grzegorz.chodzicki AT protonmail DOT com>

pkgname='virtualbox-unattended-templates'
pkgver=7.0.10
pkgrel=1
pkgdesc='Unattended Templates for Virtualbox'
url='https://www.virtualbox.org/'
arch=('x86_64')
license=('GPL3')
optdepends=('virtualbox')
source=("https://download.virtualbox.org/virtualbox/${pkgver}/VirtualBox-${pkgver}.tar.bz2")
sha256sums=('0b1e6d8b7f87d017c7fae37f80586acff04f799ffc1d51e995954d6415dee371')

package() {
	local share_vbox="${pkgdir}"/usr/share/virtualbox
	mkdir -p "${share_vbox}"
	cp -R VirtualBox-${pkgver}/src/VBox/Main/UnattendedTemplates "${share_vbox}"
}
