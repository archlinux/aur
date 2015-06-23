# Contributor: Zeph <zeph33@gmail.com>
# Maintainer: Zeph <zeph33@gmail.com>
pkgname=gns3-launcher-icons
pkgver=0.8.6
pkgrel=2
pkgdesc="Graphical network simulator - desktop launcher and icons ressource "
arch=('i686' 'x86_64')
url="http://www.gns3.net/"
license=('GPL2')
depends=('gns3' 'desktop-file-utils' 'hicolor-icon-theme')
install=gns3-launcher-icons.install

source=("http://ppa.launchpad.net/gns3/ppa/ubuntu/pool/main/g/gns3/gns3_$pkgver-1~ppa4.debian.tar.gz")
md5sums=('c5bfc765c470ba39c3baa73fc978b111')

package() {
	mkdir -p $pkgdir/usr/share;
	cp -r $srcdir/debian/additional/applications $pkgdir/usr/share
	cp -r $srcdir/debian/additional/icons $pkgdir/usr/share
	cp -r $srcdir/debian/additional/pixmaps $pkgdir/usr/share
}
