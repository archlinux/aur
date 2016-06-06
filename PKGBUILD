# Maintainer: Oliver Jaksch <arch-aur@com-in.de>

pkgname=anydesk
pkgver=2.3.1
pkgrel=2
pkgdesc="'AnyDesk Free' is an All-In-One Software for Remote Support"
arch=('i686' 'x86_64')
url="http://anydesk.de/"
license=('custom:Freeware')
depends=('gtkglext')
optdepends=('libpulse')

source_i686=(http://download.anydesk.com/linux/${pkgname}_${pkgver}-1_i386.deb)
source_x86_64=(http://download.anydesk.com/linux/${pkgname}_${pkgver}-1_amd64.deb)

sha256sums_i686=('ce49f313df51eefee206fa8a34397d68f46383432a5bba3e73611a3e8dd96547')
sha256sums_x86_64=('d4cc5f3e60235177696f17ca558e6bb4a46bdc9862b15ba4bb9d3029c20904e6')

package() {
    cd "${pkgdir}"
    tar xf "${srcdir}/data.tar.gz"
    # If you want to keep the autostart mode, comment next line
    rm -rf etc/
}
