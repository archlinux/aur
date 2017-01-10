pkgname=gnome-shell-extension-zorin-taskbar
pkgver=1.1.1
pkgrel=1
pkgdesc="Various settings and changes for the panel in Zorin Desktop."
arch=('i686' 'x86_64')
url="http://zorinos.com/"
license=('GPL-2+')
depends=('gnome-shell')
options=('!emptydirs' '!strip')
install=${pkgname}.install
source=("http://ppa.launchpad.net/zorinos/stable/ubuntu/pool/main/g/gnome-shell-extension-zorin-taskbar/gnome-shell-extension-zorin-taskbar_${pkgver}_all.deb")
md5sums=('e1f53b3dbf6a24d52d3efbfca325b79d')

package() {
  msg2 "Extracting the data.tar.xz..."
  bsdtar -xf data.tar.xz -C "$pkgdir/"
}
 
