pkgname=gnome-shell-extension-mediaplayer
pkgver=3.5-3+zorin3_all
pkgrel=1
pkgdesc="Various settings and changes for the dash in Zorin Desktop."
arch=('i686' 'x86_64')
url="http://zorinos.com/"
license=('GPL-2+')
depends=('gnome-shell')
options=('!emptydirs' '!strip')
install=${pkgname}.install
source=('http://ppa.launchpad.net/zorinos/stable/ubuntu/pool/main/g/gnome-shell-extension-mediaplayer/gnome-shell-extension-mediaplayer_3.5-3+zorin3_all.deb')
md5sums=('6cbd5f37d434e09e59929b44ff60fcbd')

package() {
  msg2 "Extracting the data.tar.xz..."
  bsdtar -xf data.tar.xz -C "$pkgdir/"
}
 
