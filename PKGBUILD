# Contributor: Florian Dejonckheere <florian at floriandejonckheere dot be>
# Contributor: Murtuza Akhtari <inxsible at gmail dot com>

pkgname=thinkalert
pkgver=0.1
pkgrel=2
pkgdesc="program for manipulating the ThinkLight LED on Thinkpad laptops. "
arch=('i686' 'x86_64')
url="http://www.mike.tl/other/ThinkAlert.html"
license=('unknown')
source=("https://github.com/floriandejonckheere/thinkalert/archive/v${pkgver}.tar.gz")
md5sums=('f71c5eccbf98d75053e0af2b4490257e')

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
