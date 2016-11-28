# Maintainer: xpt <user.xpt@gmail.com>
pkgname=ftool
pkgver=3.01
pkgrel=1
pkgdesc="Ftool is a program designed for instruction on the analysis of plane frame structures"
arch=('i686' 'x86_64')
url="http://www.alis-sol.com.br/ftool/index_en.html"
# license=('')
source=('http://www.tecgraf.puc-rio.br/ftp_pub/lfm/ftool301linux32_64.tgz')
md5sums=('0c7101921ff92a6ac317bedd98be0623')
 
package() {

mkdir -p $pkgdir/usr/bin
cd $srcdir/
install -Dm 755 Ftool $pkgdir/usr/bin/ftool

} 
