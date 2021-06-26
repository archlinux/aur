# Maintainer: Joaquin "ShyanJMC" Crespo <joaquincrespo96@gmail.com> <shyan@shyanjmc.com>

pkgname=openrc-init_scripts
pkgver=1.2.2
pkgrel=1
pkgdesc="A compilation of init scripts for OpenRC sysinit."
arch=('any')
url="https://shyanjmc.com"
license=('GPL')
depends=('openrc')
source=('cupsd.initd'
	'boinc.initd'
	'template.initd')
sha256sums=('SKIP'
	'SKIP'
	'SKIP')

package(){
	chmod +x cupsd.initd boinc.initd
	mkdir -p $pkgdir/etc/init.d/
	cp cupsd.initd boinc.initd $pkgdir/etc/init.d/
}
