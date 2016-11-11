pkgname=gnome-shell-extension-zorin-dash
pkgver=1.0.9
pkgrel=1
pkgdesc="Various settings and changes for the dash in Zorin Desktop."
arch=('i686' 'x86_64')
url="http://zorinos.com/"
license=('GPL-2+')
depends=('gnome-shell')
options=('!emptydirs' '!strip')
install=${pkgname}.install
source=("http://ppa.launchpad.net/zorinos/stable/ubuntu/pool/main/g/gnome-shell-extension-zorin-dash/gnome-shell-extension-zorin-dash_${pkgver}_all.deb")
md5sums=('8c9b1d2055d681b56f5cf942f256b3ae')

package() {
  msg2 "Extracting the data.tar.xz..."
  bsdtar -xf data.tar.xz -C "$pkgdir/"
}
 
