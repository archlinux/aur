# Maintainer: Joaquin "ShyanJMC" Crespo <joaquincrespo96@gmail.com> <shyan@shyanjmc.com>

pkgname=openrc-init_scripts
pkgver=1.0
pkgrel=1
pkgdesc="A compilation of init scripts for OpenRC sysinit."
arch=('any')
url="https://shyanjmc.com"
license=('GPL')
depends=('openrc')
source=('cupsd.initd')
sha256sums=('SKIP')

package(){
	mkdir -p $pkgdir/etc/init.d/
	cp cupsd.initd $pkgdir/etc/init.d/
}
