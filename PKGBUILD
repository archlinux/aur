# Maintainer: Luke Chen Shui <chenshuiluke@gmail.com>
pkgname=blitz-request
pkgver=1.0.0.5
pkgrel=7
epoch=
pkgdesc="The best commandline REST API and stress tester. "
arch=('i686' 'x86_64')
url="https://github.com/chenshuiluke/blitz-request"
license=(GPL)
depends=('jdk8-openjdk' 'jre8-openjdk')
source=("https://github.com/chenshuiluke/blitz-request/releases/download/1.0.0.5/blitz-request.jar")
noextract=("blitz-request.jar")
md5sums=('SKIP')
package() {
	mkdir $pkgdir/usr
	mkdir $pkgdir/usr/bin
	cp ../blitz-request.sh $pkgdir/usr/bin/blitz-request
	cp blitz-request.jar $pkgdir/usr/bin
	chmod a+x $pkgdir/usr/bin/blitz-request
	chmod a+x $pkgdir/usr/bin/blitz-request.jar
}


