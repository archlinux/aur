# Contributor: Max Devaine <maxdevaine@gmail.com>

pkgname=msgviewer
pkgver=1.9
pkgrel=1
pkgdesc='MsgViewer is email-viewer utility for .msg e-mail messages, implemented in pure Java.'
arch=(i686 x86_64)
url='https://sourceforge.net/projects/msgviewer/'
license=('GPL3')
source=("MSGViewer-${pkgver}-${pkgrel}.noarch.rpm::http://sourceforge.net/projects/$pkgname/files/MSGViewer-${pkgver}/MSGViewer-${pkgver}-${pkgrel}.noarch.rpm/download")

md5sums=('8a5c1581e9f774fd9a25d74a2cef554e')

prepare() {

     mkdir $srcdir/usr/bin/
     ln -s "/opt/MSGViewer/MSGViewer" "$srcdir/usr/bin/msgviewer"

}

 package() {

    cp -r $srcdir/opt $pkgdir/
    cp -r $srcdir/usr $pkgdir/
}
