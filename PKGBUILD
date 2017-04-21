# Maintainer: Nissar Chababy <funilrys at outlook dot com>
# Ex-Maintainer: 	Jeroen Bollen <jbinero at gmail dot comau>

pkgname=ckbcomp
pkgver=1.164
pkgrel=1
pkgdesc="Compile a XKB keyboard description to a keymap suitable for loadkeys or kbdcontrol"
arch=(any)
url="http://anonscm.debian.org/cgit/d-i/console-setup.git/"
license=('GPL2')
depends=('perl')
source=("http://ftp.de.debian.org/debian/pool/main/c/console-setup/console-setup_${pkgver}.tar.xz")
sha512sums=('89f69d97014ff3023ff28020bc214be8746bad8e1d59369d3fc5333e357dc3f2c486336507f5480a5ad22a4ad8c541b895782b60151f78ad43aa0732f2cee8c5')

package() {
  cd console-setup-${pkgver}
  install -d ${pkgdir}/usr/bin/
  install -m755 Keyboard/ckbcomp ${pkgdir}/usr/bin/
}
