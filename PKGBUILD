# Maintainer: Michael Gerber <aur at lynxcore dot org >
pkgname=open-xchange-l10n-de-de
pkgver=7.8.0
pkgrel=6
pkgdesc='Package containing Open-Xchange backend localization for de_DE'
groups=()
install='open-xchange-l10n-de-de.install'
arch=('any')
url='http://www.ox.io/'
license=('GPLv2')
depends=('open-xchange-core')
makedepends=()
conflicts=()
provides=('open-xchange-l10n-de-de')
source=('https://software.open-xchange.com/products/appsuite/stable/debs/DebianJessie/all/open-xchange-l10n-de-de_7.8.0-6_all.deb')
sha256sums=('69df5435237970021f7e894ee71dbbe4bf7c4892aad13e8974f7b7c4175ac938')

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
