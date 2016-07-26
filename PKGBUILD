# Maintainer: Valerio Pizzi (Pival81) <pival81@yahoo.com>

pkgname="orb-creator"
pkgver=0.5.012
pkgrel=1
pkgdesc="A program to package Linux software into easy-to-use “ORBs”"
url="orbital-apps.com"
depends=('xdotool' 'lsb-release' 'squashfs-tools')
makedepends=('rpmextract')
arch=('i686' 'x86_64')
license=('GPL3')
source=("https://www.orbital-apps.com/files/orb-creator/${pkgname}_${pkgver}.rpm")
md5sums=("SKIP")

package() {
	cd $pkgdir
	rpmextract.sh $srcdir/${pkgname}_${pkgver}.rpm 
}
