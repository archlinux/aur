pkgname=gnome-shell-extension-zorin-menu
pkgver=1.1
pkgrel=1
pkgdesc="The official applications menu for Zorin OS."
arch=('i686' 'x86_64')
url="http://zorinos.com/"
license=('GPL-2+')
depends=('gnome-shell')
options=('!emptydirs' '!strip')
install=${pkgname}.install
source=("http://ppa.launchpad.net/zorinos/stable/ubuntu/pool/main/g/gnome-shell-extension-zorin-menu/gnome-shell-extension-zorin-menu_${pkgver}_all.deb")
md5sums=('50139041ee552de677c81613164dcbfa')

package() {
  msg2 "Extracting the data.tar.xz..."
  bsdtar -xf data.tar.xz -C "$pkgdir/"
}
 
