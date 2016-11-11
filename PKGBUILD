pkgname=gnome-shell-extension-zorin-window-list-bottom-panel
pkgver=1.0.4
pkgrel=1
pkgdesc="Various settings and changes for the panel in Zorin Desktop."
arch=('i686' 'x86_64')
url="http://zorinos.com/"
license=('GPL-2+')
depends=('gnome-shell')
options=('!emptydirs' '!strip')
install=${pkgname}.install
source=("http://ppa.launchpad.net/zorinos/stable/ubuntu/pool/main/g/gnome-shell-extension-zorin-window-list-bottom-panel/gnome-shell-extension-zorin-window-list-bottom-panel_${pkgver}_all.deb")
md5sums=('e4d85fb29b45e84f2152ce777d0730be')

package() {
  msg2 "Extracting the data.tar.xz..."
  bsdtar -xf data.tar.xz -C "$pkgdir/"
}
 
