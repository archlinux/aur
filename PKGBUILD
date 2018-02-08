
# Maintainer: lisuke <1657787678@qq.com>
pkgname=miredo-debian
pkgver=1.2.6
pkgrel=1

pkgdesc="miredo, miredo.deb"
arch=('armv7h')
conflicts=('judy')
url="https://packages.debian.org/jessie/miredo"
license=('unknown')
options=('!strip')

makedepends=('tar')
checkdepends=()

source=(
	"http://ftp.cn.debian.org/debian/pool/main/m/${pkgname}/${pkgname}_${pkgver}-2_armhf.deb"
		)
noextract=()
md5sums=(
	'4680e1bf2fa322d442be326f94490114'
		)
validpgpkeys=()

package() {
	cd ${srcdir}
	ar vx ${pkgname}_${pkgver}-2_armhf.deb || return 1
    tar fx data.tar.xz -C ${pkgdir}/ || return 1
	ls ${pkgdir}
}
