pkgname=gnome-shell-extension-zorin-dash
pkgver=1.3_all
pkgrel=1
pkgdesc="Various settings and changes for the dash in Zorin Desktop."
arch=('i686' 'x86_64')
url="http://zorinos.com/"
license=('GPL-2+')
depends=('gnome-shell')
options=('!emptydirs' '!strip')
install=${pkgname}.install
source=('http://ppa.launchpad.net/zorinos/stable/ubuntu/pool/main/g/gnome-shell-extension-zorin-dash/gnome-shell-extension-zorin-dash_1.3_all.deb')
md5sums=('2c8f6d35d3500a032942e360002d7778')

package() {
  msg2 "Extracting the data.tar.xz..."
  bsdtar -xf data.tar.xz -C "$pkgdir/"
}
 
