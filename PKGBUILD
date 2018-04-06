pkgname=gnome-shell-extension-zorin-window-list-bottom-panel
pkgver=1.2.2_all
pkgrel=1
pkgdesc="Various settings and changes for the panel in Zorin Desktop."
arch=('i686' 'x86_64')
url="http://zorinos.com/"
license=('GPL-2+')
depends=('gnome-shell')
options=('!emptydirs' '!strip')
install=${pkgname}.install
source=('http://ppa.launchpad.net/zorinos/stable/ubuntu/pool/main/g/gnome-shell-extension-zorin-window-list-bottom-panel/gnome-shell-extension-zorin-window-list-bottom-panel_1.2.2_all.deb')
md5sums=('5f8a08b21fb2b6e860fe30dc78fcc017')

package() {
  msg2 "Extracting the data.tar.xz..."
  bsdtar -xf data.tar.xz -C "$pkgdir/"
}
 
