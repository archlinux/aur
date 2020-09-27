# Maintainer: Grzegorz Chodzicki <grzegorz.chodzicki AT protonmail DOT com>

pkgname='virtualbox-unattended-templates'
pkgver=6.1.14
pkgrel=1

pkgdesc="Unattended Templates for Virtualbox"
url="https://www.virtualbox.org/"
arch=('x86_64')
license=('GPL2')

optdepends=('virtualbox')

source=("https://download.virtualbox.org/virtualbox/${pkgver}/VirtualBox-${pkgver}a.tar.bz2")
sha256sums=('16f3cb83ab3c4dacf2a9d3cc638cbd18db23767828bba6b8ba1c1b57abeb6aef')

package() {
	cd "$srcdir"
	mkdir -p ${pkgdir}/usr/share/virtualbox
	cp -R VirtualBox-${pkgver}/src/VBox/Main/UnattendedTemplates ${pkgdir}/usr/share/virtualbox
}
