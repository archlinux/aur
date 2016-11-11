pkgname=gnome-shell-extension-zorin-media-controls
pkgver=1.0.6
pkgrel=1
pkgdesc="Various settings and changes for the dash in Zorin Desktop."
arch=('i686' 'x86_64')
url="http://zorinos.com/"
license=('GPL-2+')
depends=('gnome-shell')
options=('!emptydirs' '!strip')
install=${pkgname}.install
source=("http://ppa.launchpad.net/zorinos/stable/ubuntu/pool/main/g/gnome-shell-extension-zorin-media-controls/gnome-shell-extension-zorin-media-controls_${pkgver}_all.deb")
md5sums=('4cb5d3a1110e9eb793bec015c19c70b8')

package() {
  msg2 "Extracting the data.tar.xz..."
  bsdtar -xf data.tar.xz -C "$pkgdir/"
}
 
