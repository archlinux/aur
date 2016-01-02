# Maintainer: Michael Gerber <aur at lynxcore dot org >
pkgname=open-xchange-appsuite-l10n-en-us
pkgver=7.8.0
pkgrel=6
pkgdesc='Translation of the OX App Suite HTML5 client (en_US)'
groups=()
install='open-xchange-appsuite-l10n-en-us.install'
arch=('any')
url='http://www.ox.io/'
license=('GPLv2')
depends=('open-xchange-l10n-en-us')
makedepends=()
conflicts=()
provides=('open-xchange-appsuite-l10n-en-us')
source=('https://software.open-xchange.com/products/appsuite/stable/debs/DebianJessie/all/open-xchange-appsuite-l10n-en-us_7.8.0-6_all.deb')
sha256sums=('c33e785a0abf87ff33e98eedc2c43f0a37d7739c3f0e0f111ebf6a9114d1cec1')

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
