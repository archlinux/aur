# Maintainer: Oliver Jaksch <arch-aur@com-in.de>

pkgname=anydesk
pkgver=2.7.1
pkgrel=1
pkgdesc="'AnyDesk Free' is an All-In-One Software for Remote Support"
arch=('i686' 'x86_64')
url="http://anydesk.de/"
license=('custom:Freeware')
depends=('gtkglext')
optdepends=('libpulse')

source_i686=(http://download.anydesk.com/linux/${pkgname}_${pkgver}-1_i386.deb)
source_x86_64=(http://download.anydesk.com/linux/${pkgname}_${pkgver}-1_amd64.deb)

sha256sums_i686=('38f89b214cdb537e9a35d71462bb2edfae6b1ff137f69c12f402f5d52af84288')
sha256sums_x86_64=('318436a695bebd12919ebc94abca0660d236cc53066bdedd6c5ae9f4f3a9780b')

package() {
    cd "${pkgdir}"
    tar xf "${srcdir}/data.tar.gz"
    #
    # If you want to keep the autostart mode, comment next line
    rm -rf etc/
}
