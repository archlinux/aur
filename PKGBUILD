# Maintainer: Oliver Jaksch <arch-aur@com-in.de>

pkgname=anydesk
pkgver=2.3.0
pkgrel=1
pkgdesc="'AnyDesk Free' is an All-In-One Software for Remote Support"
arch=('i686' 'x86_64')
url="http://anydesk.de/"
license=('custom:Freeware')
depends=('gtkglext')

source_i686=(http://download.anydesk.com/linux/${pkgname}_${pkgver}-1_i386.deb)
source_x86_64=(http://download.anydesk.com/linux/${pkgname}_${pkgver}-1_amd64.deb)

sha256sums_i686=('a8fd6e9d2f86459f600c3c0762cea90343d01532a2a7e4df1c4bac3bb9e560c3')
sha256sums_x86_64=('bddb4bffc95eaf5f0b7b74625de71d62ea6ed96a132ba0240160515a4f145fac')

package() {
    cd "${pkgdir}"
    tar xf "${srcdir}/data.tar.gz"
    # If you want to keep the autostart mode, comment next line
    rm -rf etc/
}
