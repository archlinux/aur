# Contributor: goten002 <goten002@gmail.com>
# Maintainer: saxonbeta <saxonbeta at gmail>
pkgname=mynotex
pkgver=1.3.0.1
pkgrel=2
pkgdesc="A free note-taking and notes manager software for Linux."
url="http://sites.google.com/site/mynotex"
license=('GPL')
arch=('i686' 'x86_64')
depends=('sqlite3' 'gtk2')

if [ "$CARCH" = "i686" ]; then
	debarch=("i386")
	source=(http://sites.google.com/site/mynotex/files/mynotex_${pkgver}_i386.deb)
	md5sums=('ada44057854a8546473bfde51b870d82')
fi

if [ "$CARCH" = "x86_64" ]; then
	debarch=("amd64")
	source=(http://sites.google.com/site/mynotex/files/mynotex_${pkgver}_amd64.deb)
	md5sums=('a2022dbe21702bd88b2bca9f5b0cd9ac')
fi

package() {

  cd $srcdir 
  tar Jxvf data.tar.xz -C "$pkgdir/"
  
}
