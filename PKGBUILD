# Maintainer: Michael Gerber <aur at lynxcore dot org >
pkgname=open-xchange-push-imapidle
pkgver=7.8.0
pkgrel=6
pkgdesc='The Open-Xchange IMAP IDLE Push Bundle'
groups=()
install='open-xchange-push-imapidle.install'
arch=('any')
url='http://www.ox.io/'
license=('GPLv2')
depends=('open-xchange-imap')
makedepends=()
conflicts=()
provides=('open-xchange-push-imapidle')
source=('https://software.open-xchange.com/products/appsuite/stable/debs/DebianJessie/all/open-xchange-push-imapidle_7.8.0-6_all.deb')
sha256sums=('d4c2b345e064dee9890b499cce7921ad13ef79f25f78e4f3b19b0238e804c828')

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
