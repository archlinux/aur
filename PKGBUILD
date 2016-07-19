# Contributor: Max Devaine <maxdevaine@gmail.com>

pkgname=msgviewer
pkgver=1.9
pkgrel=1
pkgdesc='AT commands as input are sent to modem and responses given as output.'
arch=(i686 x86_64)
url='http://https://sourceforge.net/projects/msgviewer/'
license=('GPL3')
makedepends=('')
conflicts=('')
source=("http://heanet.dl.sourceforge.net/project/$pkgname/MSGViewer-$pkgver/MSGViewer-$pkgver-$pkgrel.noarch.rpm")
md5sums=('8a5c1581e9f774fd9a25d74a2cef554e')

 package() {
     cd "$pkgdir"
     rpmextract.sh $srcdir/MSGViewer-$pkgver-$pkgrel.noarch.rpm

     mkdir $pkgdir/usr/bin/
     ln -s "/opt/MSGViewer/MSGViewer" "$pkgdir/usr/bin/msgviewer"
}
