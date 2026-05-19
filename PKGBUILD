# Maintainer:  mrxx <mrxx at cyberhome dot at>

pkgname=beebeep-bin
pkgver=5.8.6
pkgrel=1
pkgdesc="Secure LAN messenger and file sender (binary version)"
arch=('x86_64')
url="https://www.beebeep.net"
license=('GPL3')
depends=('qt5-multimedia' 'qt5-x11extras')
source=("https://sourceforge.net/projects/beebeep/files/Linux/beebeep_${pkgver}_amd64.deb")
sha256sums=('ff2bd2fcee5f07844904be88162839c205b92e8632bdadae7f07f1ea27912ae7')

prepare() {
    bsdtar xf data.tar.xz
}

package() {
  install -d $pkgdir/usr/{bin,share}
  ln -s /usr/lib/beebeep/beebeep $pkgdir/usr/bin/
}
