# Maintainer: Michael Gerber <aur at lynxcore dot org >
pkgname=open-xchange-l10n-en-us
pkgver=7.8.0
pkgrel=6
pkgdesc='Package containing Open-Xchange backend localization for en_US'
groups=()
install='open-xchange-l10n-en-us.install'
arch=('any')
url='http://www.ox.io/'
license=('GPLv2')
depends=('open-xchange-core')
makedepends=()
conflicts=()
provides=('open-xchange-l10n-en-us')
source=('https://software.open-xchange.com/products/appsuite/stable/debs/DebianJessie/all/open-xchange-l10n-en-us_7.8.0-6_all.deb')
sha256sums=('825af0840eaa16a6135ddd1d3e9ed72e4280327d18e93df64dd3d20aa4698d1d')

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
