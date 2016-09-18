# Maintainer: Nissar Chababy <funilrys at outlook dot com>
# Ex-Maintainer: 	Jeroen Bollen <jbinero at gmail dot com>

pkgname=ckbcomp
pkgver=1.148
pkgrel=1
pkgdesc="Compile a XKB keyboard description to a keymap suitable for loadkeys or kbdcontrol"
arch=(any)
url="http://anonscm.debian.org/cgit/d-i/console-setup.git/"
license=('GPL2')
depends=('perl')
source=("http://ftp.de.debian.org/debian/pool/main/c/console-setup/console-setup_${pkgver}.tar.xz")
sha512sums=('d4a20326842a1c4dd6d169d3c4a2313895e2d5891687e7cca9abbe59842f9433efe2de37ab26f231b2991d81d2bcc77a9780c22e8252e4a045a91f28078422ed')

package() {
  cd console-setup-${pkgver}
  install -d ${pkgdir}/usr/bin/
  install -m755 Keyboard/ckbcomp ${pkgdir}/usr/bin/
}
