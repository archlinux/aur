# Maintainer: Nissar Chababy <funilrys at outlook dot com>
# Ex-Maintainer: 	Jeroen Bollen <jbinero at gmail dot com>

pkgname=ckbcomp
pkgver=1.153
pkgrel=1
pkgdesc="Compile a XKB keyboard description to a keymap suitable for loadkeys or kbdcontrol"
arch=(any)
url="http://anonscm.debian.org/cgit/d-i/console-setup.git/"
license=('GPL2')
depends=('perl')
source=("http://ftp.de.debian.org/debian/pool/main/c/console-setup/console-setup_${pkgver}.tar.xz")
sha512sums=('85d30db6a863e4421234ce0c13966c5be75bbd209f59c74f55097e0727192e9c7246a5623add80abb5ffb4b21e8d015dabd2f5d484a5a29a9891f27057a5bf93')

package() {
  cd console-setup-${pkgver}
  install -d ${pkgdir}/usr/bin/
  install -m755 Keyboard/ckbcomp ${pkgdir}/usr/bin/
}
