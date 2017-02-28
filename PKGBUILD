pkgname=gnome-shell-extension-zorin-dash
pkgver=1.1.5_all
pkgrel=1
pkgdesc="Various settings and changes for the dash in Zorin Desktop."
arch=('i686' 'x86_64')
url="http://zorinos.com/"
license=('GPL-2+')
depends=('gnome-shell')
options=('!emptydirs' '!strip')
install=${pkgname}.install
source=('http://ppa.launchpad.net/zorinos/stable/ubuntu/pool/main/g/gnome-shell-extension-zorin-dash/gnome-shell-extension-zorin-dash_1.1.5_all.deb')
md5sums=('65a30424642f74d93dd8cb09eae30f9d')

package() {
  msg2 "Extracting the data.tar.xz..."
  bsdtar -xf data.tar.xz -C "$pkgdir/"
}
 
