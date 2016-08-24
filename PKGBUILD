# Maintainer: Oliver Jaksch <arch-aur@com-in.de>

pkgname=anydesk
pkgver=2.3.6
pkgrel=1
pkgdesc="'AnyDesk Free' is an All-In-One Software for Remote Support"
arch=('i686' 'x86_64')
url="http://anydesk.de/"
license=('custom:Freeware')
depends=('gtkglext')
optdepends=('libpulse')

source_i686=(http://download.anydesk.com/linux/${pkgname}_${pkgver}-1_i386.deb)
source_x86_64=(http://download.anydesk.com/linux/${pkgname}_${pkgver}-1_amd64.deb)

sha256sums_i686=('834beb4ce5ce9f46336c66ce0dcdec58a96b8347f5dfcd608a1a86b7655b3695')
sha256sums_x86_64=('7f96a7f3b2d91f513b105e1b77d545456fd32108d364b81e6e74f3ef044423a9')

package() {
    cd "${pkgdir}"
    tar xf "${srcdir}/data.tar.gz"
    # If you want to keep the autostart mode, comment next line
    rm -rf etc/
}
