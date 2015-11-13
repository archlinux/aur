# Maintainer: Oliver Jaksch <arch-aur@com-in.de>

pkgname=anydesk
pkgver=2.1.1
pkgrel=2
pkgdesc="'AnyDesk Free' is an All-In-One Software for Remote Support"
arch=('i686' 'x86_64')
url="http://anydesk.de/"
license=('custom:Freeware')
depends=('gtkglext')

source_i686=(http://download.anydesk.com/linux/debian/${pkgname}_${pkgver}-1_i386.deb)
source_x86_64=(http://download.anydesk.com/linux/debian/${pkgname}_${pkgver}-1_amd64.deb)

sha256sums_i686=('d6916df9135498da2b5b498475f4eb001e84c67bdccea9b31527c96d6436bd1b')
sha256sums_x86_64=('52b928881f1d3af4c1a944dde3188a9febcf8b8beb9e2b64992855c477c2b306')

package() {
    cd "${pkgdir}"
    tar xf "${srcdir}/data.tar.gz"
    # If you want to keep the autostart mode, comment next line
    rm -rf etc/
}
