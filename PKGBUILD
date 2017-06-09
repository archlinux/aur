# Maintainer: j1simon

pkgname=buttercup
pkgver=0.17.2
pkgrel=1
pkgdesc='Javascript Password Vault - Multi-Platform Desktop Application'
arch=('x86_64')
url='https://buttercup.pw/'
license=('GNU/GPL Version 3')
#depends=('graphicsmagick')
provides=('buttercup')
source=("https://github.com/buttercup/buttercup/releases/download/v${pkgver}/buttercup-${pkgver}.rpm")
md5sums=('9082021383d7e15d836fd136a0df292c')

package() {
	cp -R "${srcdir}"/opt "${pkgdir}"
	install -d "${pkgdir}"/usr/share
	cp -R "${srcdir}"/usr/share/* "${pkgdir}"/usr/share    
}
