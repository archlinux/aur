# Maintainer: Hythlodaeus <matteodelseppiaomm@gmail.com>
pkgname=cryptcat
pkgver=1.2.1
pkgrel=1
pkgdesc="Cryptcat is the standard netcat enhanced with twofish 
encryption"
arch=(i686 x86_64)
url="https://cryptcat.sourceforge.net"
license=('GPLv2')
provides=('cryptcat')
source=("http://downloads.sourceforge.net/project/cryptcat/cryptcat-unix-1.2/cryptcat-unix-1.2.1/cryptcat-unix-1.2.1.tar?r=https%3A%2F%2Fsourceforge.net%2Fprojects%2Fcryptcat%2Ffiles%2Fcryptcat-unix-1.2%2Fcryptcat-unix-1.2.1%2F&ts=1464475005&use_mirror=iweb")
md5sums=(fc4afff350f3dd5e4fe51b0dd01a8e21)
build() {
	cd unix
	make linux
}


package() {
	cd unix
        mkdir $pkgdir/usr && $pkgdir/usr/bin
	cp -v cryptcat $pkgdir/usr/bin/cryptcat
}
