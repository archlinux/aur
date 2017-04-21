pkgname=gnome-shell-extensions-zorin-desktop
pkgver=1.0.6_all
pkgrel=1
pkgdesc="Various settings and changes for the panel in Zorin Desktop."
arch=('i686' 'x86_64')
url="http://zorinos.com/"
license=('GPL-2+')
depends=('gnome-shell')
options=('!emptydirs' '!strip')
install=${pkgname}.install
source=('http://ppa.launchpad.net/zorinos/stable/ubuntu/pool/main/g/gnome-shell-extensions-zorin-desktop/gnome-shell-extensions-zorin-desktop_1.0.6_all.deb')
md5sums=('c532b06e49fcca499d7513234691ad15')

package() {
  msg2 "Extracting the data.tar.xz..."
  bsdtar -xf data.tar.xz -C "$pkgdir/"
}
 
