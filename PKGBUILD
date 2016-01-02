# Maintainer: Michael Gerber <aur at lynxcore dot org >
pkgname=open-xchange-oauth
pkgver=7.8.0
pkgrel=6
pkgdesc='The Open-Xchange OAuth implementation'
groups=()
install='open-xchange-oauth.install'
arch=('any')
url='http://www.ox.io/'
license=('GPLv2')
depends=('open-xchange-core')
makedepends=()
conflicts=()
provides=('open-xchange-oauth')
source=('https://software.open-xchange.com/products/appsuite/stable/debs/DebianJessie/all/open-xchange-oauth_7.8.0-6_all.deb')
sha256sums=('0121bcd6eac9fc52095414e6ec62e79d0831858c9f0d2f7328af8f44bd9c4c42')

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
