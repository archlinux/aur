# Maintainer: Michael Gerber <aur at lynxcore dot org >
pkgname=open-xchange-appsuite-l10n-de-de
pkgver=7.8.0
pkgrel=6
pkgdesc='Translation of the OX App Suite HTML5 client (de_DE)'
groups=()
install='open-xchange-appsuite-l10n-de-de.install'
arch=('any')
url='http://www.ox.io/'
license=('GPLv2')
depends=('open-xchange-l10n-de-de')
makedepends=()
conflicts=()
provides=('open-xchange-appsuite-l10n-de-de')
source=('https://software.open-xchange.com/products/appsuite/stable/debs/DebianJessie/all/open-xchange-appsuite-l10n-de-de_7.8.0-6_all.deb')
sha256sums=('238481c5607d9cc0268a804de877487ebede714dcae8741188814ff08e0975d4')

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
