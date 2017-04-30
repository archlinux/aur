# Maintainer: Oliver Jaksch <arch-aur@com-in.de>

pkgname=anydesk
pkgver=2.9.0
pkgrel=1
pkgdesc="'AnyDesk Free' is an All-In-One Software for Remote Support"
arch=('i686' 'x86_64')
url="http://anydesk.de/"
license=('custom:Freeware')
depends=('gtkglext')
optdepends=('libpulse')

source_i686=(http://download.anydesk.com/linux/${pkgname}_${pkgver}-1_i386.deb)
source_x86_64=(http://download.anydesk.com/linux/${pkgname}_${pkgver}-1_amd64.deb)

sha256sums_i686=('9b1d898cc570e497c9239f3e28184d1b64f1fb5d2c3d699ced090021ca1a5ce3')
sha256sums_x86_64=('75b1332922a29ad5c829066e83b85d85037c4f290fe32d1ba1ab022e2c69ca95')

package() {
    cd "${pkgdir}"
    tar xf "${srcdir}/data.tar.gz"
    #
    # If you want to keep the autostart mode, comment next line
    rm -rf etc/
}
