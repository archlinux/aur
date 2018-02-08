
# Maintainer: lisuke <1657787678@qq.com>
pkgname=libjudydebian1
pkgver=1.0.5
pkgrel=1

pkgdesc="judy, libjudydebian1.deb"
arch=('armv7h')
conflicts=('judy')
url="https://packages.debian.org/jessie/libjudydebian1"
license=('unknown')
options=('!strip')

makedepends=()
checkdepends=()

source=(
	"http://ftp.cn.debian.org/debian/pool/main/j/judy/${pkgname}_${pkgver}-${pkgrel}_armhf.deb"
		)
noextract=()
#md5sums=(
#	''
#		)
validpgpkeys=()

package() {
	cd ${srcdir}
	ar vx ${pkgname}_${pkgver}-${pkgrel}_armhf.deb || return 1
    tar fxz data.tar.gz || return 1
	ls ${srcdir}
}
