# Maintainer: Nissar Chababy <funilrys at outlook dot com>
# Ex-Maintainer: 	Jeroen Bollen <jbinero at gmail dot comau>

pkgname=ckbcomp
pkgver=1.163
pkgrel=1
pkgdesc="Compile a XKB keyboard description to a keymap suitable for loadkeys or kbdcontrol"
arch=(any)
url="http://anonscm.debian.org/cgit/d-i/console-setup.git/"
license=('GPL2')
depends=('perl')
source=("http://ftp.de.debian.org/debian/pool/main/c/console-setup/console-setup_${pkgver}.tar.xz")
sha512sums=('24beeab5c8d14e2176a39bc1d67008fc9a294c5fac0c10cd109c4902924cb8b605fb6ff900255d544f4e411a3702dbc58f51453f0fa92b35bb57f6df7580f307')

package() {
  cd console-setup-${pkgver}
  install -d ${pkgdir}/usr/bin/
  install -m755 Keyboard/ckbcomp ${pkgdir}/usr/bin/
}
