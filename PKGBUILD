# Maintainer: xpt <user.xpt@gmail.com>
pkgname=ftool
pkgver=4.00
pkgrel=1
pkgdesc="Ftool is a program designed for instruction on the analysis of plane frame structures"
arch=('i686' 'x86_64')
url="https://www.ftool.com.br/Ftool/"
# license=('')
source=('hib://ftool400linux32_64.tgz')
md5sums=('c4e97554761d9d940755059ee439e6e7')
options=(!strip)
DLAGENTS+=("hib::/usr/bin/echo Could not find %u. Manually download it to \"$(pwd)\", or set up a hib:// DLAGENT in /etc/makepkg.conf.")

package() {

mkdir -p $pkgdir/usr/bin
cd $srcdir/
install -Dm 755 Ftool $pkgdir/usr/bin/ftool

} 
