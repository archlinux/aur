# Maintainer: Po-An,Yang(Antonio) <yanganto@gmail.com>
pkgname=pcapfix
pkgver=1.1.0
pkgrel=1
epoch=
pkgdesc="A tool of repairing your broken pcap and pcapng files"
arch=('any')
url="https://f00l.de/pcapfix/pcapfix-1.1.0.tar.gz"
license=('GPL3')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://f00l.de/pcapfix/pcapfix-1.1.0.tar.gz")
noextract=()
md5sums=('baabfe913c399d626bec26042689ba38')
validpgpkeys=()
package() {
	mkdir -p $pkgdir/usr/bin
	cd $srcdir/pcapfix-1.1.0
	make
	mv $srcdir/pcapfix-1.1.0/pcapfix $pkgdir/usr/bin
	# chmod -R a+x $pkgdir/opt/giseditor/conf
	# cp -R $srcdir/GisEditor-$pkgver/data $pkgdir/opt/giseditor
	# cp -R $srcdir/GisEditor-$pkgver/doc $pkgdir/opt/giseditor
	# cp -R $srcdir/GisEditor-$pkgver/icon $pkgdir/opt/giseditor
	# cp -R $srcdir/GisEditor-$pkgver/mapcache $pkgdir/opt/giseditor
	# chmod -R a+w $pkgdir/opt/giseditor/mapcache
	# cp -R $srcdir/GisEditor-$pkgver/script $pkgdir/opt/giseditor
	# cp -R $srcdir/GisEditor-$pkgver/src $pkgdir/opt/giseditor
	# cp -R $srcdir/GisEditor-$pkgver/main.py $pkgdir/opt/giseditor
	# chmod +x $pkgdir/opt/giseditor/main.py 
	# mkdir -p $pkgdir/usr/bin
	# echo '#!/usr/bin/sh' > $pkgdir/usr/bin/giseditor
	# echo 'python /opt/giseditor/main.py' >> $pkgdir/usr/bin/giseditor
	# chmod +x $pkgdir/usr/bin/giseditor

	# TODO: install .desktop here and update mime type for os"
}
