# Maintainer: Nissar Chababy <funilrys at outlook dot com>
# Ex-Maintainer: 	Jeroen Bollen <jbinero at gmail dot comau>

pkgname=ckbcomp
pkgver=1.198
pkgrel=1
pkgdesc="Compile a XKB keyboard description to a keymap suitable for loadkeys or kbdcontrol"
arch=(any)
url="http://anonscm.debian.org/cgit/d-i/console-setup.git/"
license=('GPL2')
depends=('perl')
source=("http://ftp.de.debian.org/debian/pool/main/c/console-setup/console-setup_${pkgver}.tar.xz")
sha512sums=('38e6b10e6e232e49eee5de548dcec29ccc319e8b1028b4c95bc9d87ae8cc24ad635cdae87bf6c3f81fa00435bb7560a2605624ec7dd17bb3ae2ab79e22268672')

package() {
    cd console-setup-${pkgver}
    install -d ${pkgdir}/usr/bin/
    install -m755 Keyboard/ckbcomp ${pkgdir}/usr/bin/
}
