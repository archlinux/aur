# Contributor: Florian Dejonckheere <florian at floriandejonckheere dot be>
# Contributor: Murtuza Akhtari <inxsible at gmail dot com>

pkgname=thinkalert
pkgver=0.2
pkgrel=1
pkgdesc="program for manipulating the ThinkLight LED on Thinkpad laptops. "
arch=('i686' 'x86_64')
url="https://github.com/floriandejonckheere/thinkalert"
license=('unknown')
source=("https://github.com/floriandejonckheere/thinkalert/archive/v${pkgver}.tar.gz")
md5sums=('75cd15da2a4616548a286925e3663fc4')

build()
{
	cd "${srcdir}/${pkgname}-${pkgver}"
	gcc -o ${pkgname} ${pkgname}.c
}

package()
{
	cd "${srcdir}/${pkgname}-${pkgver}"
	install -Dm4755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
}
