pkgname=gnome-shell-extension-zorin-panel
pkgver=1.5.2_all
pkgrel=1
pkgdesc="Various settings and changes for the panel in Zorin Desktop."
arch=('i686' 'x86_64')
url="http://zorinos.com/"
license=('GPL-2+')
depends=('gnome-shell')
options=('!emptydirs' '!strip')
install=${pkgname}.install
source=('http://ppa.launchpad.net/zorinos/stable/ubuntu/pool/main/g/gnome-shell-extension-zorin-panel/gnome-shell-extension-zorin-panel_1.5.2_all.deb')
md5sums=('0814a341537a7450edbafa79ae173529')

package() {
  msg2 "Extracting the data.tar.xz..."
  bsdtar -xf data.tar.xz -C "$pkgdir/"
}
 
