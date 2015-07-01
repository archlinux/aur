# $Id: PKGBUILD,v 0.1 2012/11/18 20:50:21 wh Exp $
# Contributor niskii <esqueleto_bajo@outlook.com>

pkgname=mmsap2
pkgver=2.1.1
pkgrel=1
pkgdesc="mmSAP - comfortable SAP player based on ASAP library (GTK2)"
url="http://mmsap.sourceforge.net"
depends=("asap2")
makedepends=("cmake gtkmm dbus dbus-glib libglade")
arch=('i686' 'x86_64')
license=('GPL')
source=("http://downloads.sourceforge.net/mmsap/${pkgname}_${pkgver}.tar.gz")
conflicts=('mmsap')
md5sums=('c52bf517fdfe82b3f57987b874ef0fb6')

build(){
	cd $startdir/src/${pkgname}_${pkgver}/
	cmake .
	make
	mkdir -p $startdir/pkg/usr/bin
	cd src
	install mmsap2 $startdir/pkg/usr/bin
}
