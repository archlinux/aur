# Maintainer: Célestin Matte aur [at] cmatte.me
# Contributor: Carsten Feuls <archlinux at carstenfeuls dot de>

pkgname=pwstore-git
pkgver=79c1243
pkgrel=1
pkgdesc="Multi User Password store"
arch=('i686' 'x86_64' 'armv5h' 'armv6h' 'armv7h')
url="https://github.com/Perdu/pwstore"
license=('')
depends=('ruby')
makedepends=('git')
source=('pwstore-git::git+https://github.com/Perdu/pwstore.git')
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

