pkgname=gnome-shell-extension-zorin-menu
pkgver=2.0.1_all
pkgrel=1
pkgdesc="The official applications menu for Zorin OS."
arch=('i686' 'x86_64')
url="http://zorinos.com/"
license=('GPL-2+')
depends=('gnome-shell')
options=('!emptydirs' '!strip')
install=${pkgname}.install
source=('http://ppa.launchpad.net/zorinos/stable/ubuntu/pool/main/g/gnome-shell-extension-zorin-menu/gnome-shell-extension-zorin-menu_2.0.1_all.deb')
md5sums=('c5425080852c1f3e5118d81e1b78e149')

package() {
  msg2 "Extracting the data.tar.xz..."
  bsdtar -xf data.tar.xz -C "$pkgdir/"
}
 
