# Maintainer: Nissar Chababy <funilrys at outlook dot com>
# Ex-Maintainer: 	Jeroen Bollen <jbinero at gmail dot comau>

pkgname=ckbcomp
pkgver=1.195
pkgrel=1
pkgdesc="Compile a XKB keyboard description to a keymap suitable for loadkeys or kbdcontrol"
arch=(any)
url="http://anonscm.debian.org/cgit/d-i/console-setup.git/"
license=('GPL2')
depends=('perl')
source=("http://ftp.de.debian.org/debian/pool/main/c/console-setup/console-setup_${pkgver}.tar.xz")
sha512sums=('f9ee8df45cfb78dea12b1ba3020e32f245dd940bc1d22801849f673f4448853c0ebadb6944a92b462e3e56c59ee13fd6d2130c260a1a406e1bb1c72e9902c04d')

package() {
    cd console-setup
    install -d ${pkgdir}/usr/bin/
    install -m755 Keyboard/ckbcomp ${pkgdir}/usr/bin/
}
