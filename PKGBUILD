# Maintainer: Carsten Feuls <archlinux at carstenfeuls dot de>

pkgname=pwstore-git
pkgver=38745c9
pkgrel=1
pkgdesc="Multi User Password store"
arch=('i686' 'x86_64' 'armv5h' 'armv6h' 'armv7h')
url="https://github.com/formorer/pwstore"
license=('')
depends=('ruby')
source=('pwstore-git::git+https://github.com/formorer/pwstore.git')
options=('!emptydirs')
md5sums=('SKIP')
sha256sums=('SKIP')


pkgver() {
	cd ${srcdir}/${pkgname}
	git describe --always | sed 's|-|.|g'
}


package() {
	cd ${srcdir}/${pkgname}
	mkdir -p "${pkgdir}/usr/bin"
	cp pws "${pkgdir}/usr/bin/"
}

