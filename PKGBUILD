pkgname=gnome-shell-extension-zorin-window-list-bottom-panel
pkgver=1.2.1_all
pkgrel=1
pkgdesc="Various settings and changes for the panel in Zorin Desktop."
arch=('i686' 'x86_64')
url="http://zorinos.com/"
license=('GPL-2+')
depends=('gnome-shell')
options=('!emptydirs' '!strip')
install=${pkgname}.install
source=('http://ppa.launchpad.net/zorinos/stable/ubuntu/pool/main/g/gnome-shell-extension-zorin-window-list-bottom-panel/gnome-shell-extension-zorin-window-list-bottom-panel_1.2.1_all.deb')
md5sums=('b73865da1434fcf3756a24887caef681')

package() {
  msg2 "Extracting the data.tar.xz..."
  bsdtar -xf data.tar.xz -C "$pkgdir/"
}
 
