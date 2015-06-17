# Maintainer: M0Rf30

pkgname=usbtranfer
pkgver=3.0.1
pkgrel=1
pkgdesc="USBTransfer (USBAktarici) is a program for transfering popular Linux distributions to USB drive. Developed by Oğuz Kırat."
arch=('i686' 'x86_64')
url="https://code.google.com/p/usbaktarici/"
license=('GPL')
depends=('python2-pyqt4')
makedepends=('unzip')
source=(https://usbaktarici.googlecode.com/files/USBTransfer301Source.zip
	'usbtranfer')
	
package() {
  cd $srcdir
  mkdir -p $pkgdir/opt/usbtranfer
  unzip USBTransfer301Source.zip -d $pkgdir/opt/usbtranfer

# Install usbtranfer bin	
  install -D usbtranfer $pkgdir/usr/bin/usbtranfer
  chmod +x $pkgdir/usr/bin/usbtranfer
}

md5sums=('4c5eb2e8753718336026dfc1167c3d75'
         'b805ff9b9fd678bbb5c3b2e7d3db0337')
