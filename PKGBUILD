# Maintainer: Nissar Chababy <funilrys at outlook dot com>
# Ex-Maintainer: 	Jeroen Bollen <jbinero at gmail dot comau>

pkgname=ckbcomp
pkgver=1.192
pkgrel=1
pkgdesc="Compile a XKB keyboard description to a keymap suitable for loadkeys or kbdcontrol"
arch=(any)
url="http://anonscm.debian.org/cgit/d-i/console-setup.git/"
license=('GPL2')
depends=('perl')
source=("http://ftp.de.debian.org/debian/pool/main/c/console-setup/console-setup_${pkgver}.tar.xz")
sha512sums=('2a59b43d9e157034390c8a275752c39eee648cb87ccef4e4507e4a79a75adbb5c6b83aacd93b669b577fa896cef75821f54ce966177879aaec57c5d6759335c8')

package() {
    cd console-setup
    install -d ${pkgdir}/usr/bin/
    install -m755 Keyboard/ckbcomp ${pkgdir}/usr/bin/
}
