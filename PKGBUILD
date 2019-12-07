# Maintainer: Nissar Chababy <funilrys at outlook dot com>
# Ex-Maintainer: 	Jeroen Bollen <jbinero at gmail dot comau>

pkgname=ckbcomp
pkgver=1.194
pkgrel=1
pkgdesc="Compile a XKB keyboard description to a keymap suitable for loadkeys or kbdcontrol"
arch=(any)
url="http://anonscm.debian.org/cgit/d-i/console-setup.git/"
license=('GPL2')
depends=('perl')
source=("http://ftp.de.debian.org/debian/pool/main/c/console-setup/console-setup_${pkgver}.tar.xz")
sha512sums=('fe71480b45e8c88c9e46264f734d0eb21023a6afedfa6412551bb40f7525f14823befe726efc37f152a36d9a8de3aba00cd41f9fe42bcea2780c5cf8764a6b80')

package() {
    cd console-setup-${pkgver}
    install -d ${pkgdir}/usr/bin/
    install -m755 Keyboard/ckbcomp ${pkgdir}/usr/bin/
}
