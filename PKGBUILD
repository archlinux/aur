pkgname=gnome-shell-extensions-zorin-desktop
pkgver=1.0.5
pkgrel=1
pkgdesc="Various settings and changes for the panel in Zorin Desktop."
arch=('i686' 'x86_64')
url="http://zorinos.com/"
license=('GPL-2+')
depends=('gnome-shell')
options=('!emptydirs' '!strip')
install=${pkgname}.install
source=("http://ppa.launchpad.net/zorinos/stable/ubuntu/pool/main/g/gnome-shell-extensions-zorin-desktop/gnome-shell-extensions-zorin-desktop_${pkgver}_all.deb")
md5sums=('6fd8a31299d9959b434c0c65c60f503b')

package() {
  msg2 "Extracting the data.tar.xz..."
  bsdtar -xf data.tar.xz -C "$pkgdir/"
}
 
