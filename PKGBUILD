# Contributor: goten002 <goten002@gmail.com>
# Maintainer: saxonbeta <saxonbeta at gmail>
pkgname=mynotex
pkgver=1.3.1.0
pkgrel=1
pkgdesc="A free note-taking and notes manager software for Linux."
url="http://sites.google.com/site/mynotex"
license=('GPL')
arch=('i686' 'x86_64')
depends=('sqlite3' 'gtk2')

if [ "$CARCH" = "i686" ]; then
	debarch=("i386")
	source=(http://sites.google.com/site/mynotex/files/mynotex_${pkgver}_i386.deb)
        md5sums=('e2422e2a4bef4a6a73a2aeff9f09961e')
fi

if [ "$CARCH" = "x86_64" ]; then
	debarch=("amd64")
	source=(http://sites.google.com/site/mynotex/files/mynotex_${pkgver}_amd64.deb)
	md5sums=('df57fdfa2b0edab253655b7c398934af')
fi

package() {

  cd $srcdir 
  tar Jxvf data.tar.xz -C "$pkgdir/"
  
}
