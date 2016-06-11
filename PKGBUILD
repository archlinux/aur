# Maintainer: Carlos Henrique Merces Moreira "chmercesmoreira" <ch.mercesmoreira@gmail.com>
pkgname=photofilmstrip
pkgver=2.1.0
pkgrel=1
pkgdesc="Create video clips from photos"
arch=('i686' 'x86_64')
url="http://www.photofilmstrip.org/1-0-Home.html"
license=('GPL2')
depends=('python2-pip' 'wxpython')
source=("http://downloads.sourceforge.net/project/photostoryx/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz?r=&ts=1465609365&use_mirror=liquidtelecom")
md5sums=('0488f7b9cf8f99cff5b161c1911d9588')
install="${pkgname}.install"

package (){
	cd "$pkgname-$pkgver"
	pip2 install $pkgname-$pkgver.tar.gz
	pip install image
}
