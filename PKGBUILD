# Maintainer: Zeph <zeph33@gmail.com>
# Contributor: Zeph <zeph33@gmail.com>

pkgname=rabbitvcs-cli
pkgver=0.16
pkgrel=1
pkgdesc="Command Line (CLI) front-end for RabbitVCS"
arch=('i686' 'x86_64')
url="http://rabbitvcs.org/"
depends=("rabbitvcs>=$pkgver")
license=('GPL')
source=("https://github.com/rabbitvcs/rabbitvcs/archive/v0.16.tar.gz")
md5sums=('25376cff136ad2fac901ff88e07893ef')

package(){
	_pluginlocation="$pkgdir/usr/bin"
	
	cd "$srcdir/rabbitvcs-$pkgver/clients/cli"
	
	sed -i "s#env python#env python2#" rabbitvcs
	
	mkdir -p "$_pluginlocation"
	cp rabbitvcs "$_pluginlocation"
}
