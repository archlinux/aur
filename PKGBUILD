# Maintainer: Yurii Kolesnykov <root@yurikoles.com>
# Contributor: Grzegorz Chodzicki <grzegorz.chodzicki AT protonmail DOT com>

pkgname='virtualbox-unattended-templates'
pkgver=7.0.20
pkgrel=1
pkgdesc='Unattended Templates for Virtualbox'
url='https://www.virtualbox.org/'
arch=('any')
license=('GPL' 'custom:CDDL')
conflicts=('virtualbox')
source=("https://download.virtualbox.org/virtualbox/${pkgver}/VirtualBox-${pkgver}.tar.bz2")
sha256sums=('5cf5979bef66ebab3fcd495796b215a940e8a07c469d4bc56d064de44222dd02')

package() {
	local share_vbox="${pkgdir}"/usr/share/virtualbox
	mkdir -p "${share_vbox}"
	cp -R VirtualBox-${pkgver}/src/VBox/Main/UnattendedTemplates "${share_vbox}"
}
