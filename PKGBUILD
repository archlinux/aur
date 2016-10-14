pkgname=gnome-shell-extension-zorin-dash
pkgver=1.0.8
pkgrel=1
pkgdesc="Various settings and changes for the dash in Zorin Desktop."
arch=('i686' 'x86_64')
url="http://zorinos.com/"
license=('GPL-2+')
depends=('gnome-shell')
options=('!emptydirs' '!strip')
install=${pkgname}.install
source=("http://ppa.launchpad.net/zorinos/stable/ubuntu/pool/main/g/gnome-shell-extension-zorin-dash/gnome-shell-extension-zorin-dash_${pkgver}_all.deb")
md5sums=('ad771141bcc7b1e811a2b3e49375158a')

package() {
  msg2 "Extracting the data.tar.xz..."
  bsdtar -xf data.tar.xz -C "$pkgdir/"
}
 
