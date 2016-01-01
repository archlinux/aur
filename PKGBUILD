# Maintainer: Michael Gerber <aur at lynxcore dot org >
pkgname=open-xchange-smtp
pkgver=7.8.0
pkgrel=6
pkgdesc='The Open-Xchange Server SMTP Bundle'
groups=('open-xchange-minimal' 'open-xchange' 'open-xchange-all')
install='open-xchange-smtp.install'
arch=('any')
url='http://www.ox.io/'
license=('GPLv2')
depends=('open-xchange-core')
makedepends=()
conflicts=()
provides=('open-xchange-smtp')
source=('https://software.open-xchange.com/products/appsuite/stable/backend/DebianJessie/all/open-xchange-smtp_7.8.0-6_all.deb')
sha256sums=('750d3e9c545a6bbcd8279f90bdfb63022668748b5912821910039c81ac68c51f')

package() {
    if test -f "data.tar.xz"; then
        tar xf data.tar.xz
        cp -a $(find . -mindepth 1 -maxdepth 1 -type d) "$pkgdir"
    fi
    
    if test -f "data.tar.gz"; then
        tar xf data.tar.gz
        cp -a $(find . -mindepth 1 -maxdepth 1 -type d) "$pkgdir"
    fi
}
