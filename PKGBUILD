pkgname=gnome-shell-extension-zorin-menu
pkgver=1.2_all
pkgrel=1
pkgdesc="The official applications menu for Zorin OS."
arch=('i686' 'x86_64')
url="http://zorinos.com/"
license=('GPL-2+')
depends=('gnome-shell')
options=('!emptydirs' '!strip')
install=${pkgname}.install
source=('http://ppa.launchpad.net/zorinos/stable/ubuntu/pool/main/g/gnome-shell-extension-zorin-menu/gnome-shell-extension-zorin-menu_1.2_all.deb')
md5sums=('3172aa9589db9bb817e1eca1503f7076')

package() {
  msg2 "Extracting the data.tar.xz..."
  bsdtar -xf data.tar.xz -C "$pkgdir/"
}
 
