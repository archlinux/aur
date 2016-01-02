# Maintainer: Michael Gerber <aur at lynxcore dot org >
pkgname=open-xchange-drive-comet
pkgver=7.8.0
pkgrel=6
pkgdesc='Open-Xchange'
groups=('open-xchange')
install='open-xchange-drive-comet.install'
arch=('any')
url='http://www.ox.io/'
license=('GPLv2')
depends=('open-xchange-core' 'open-xchange-drive' 'open-xchange-grizzly')
makedepends=()
conflicts=()
provides=('open-xchange-drive-comet')
source=('https://software.open-xchange.com/products/appsuite/stable/backend/DebianJessie/all/open-xchange-drive-comet_7.8.0-6_all.deb')
sha256sums=('ede9cb1a4789fc59736dc74698ddd2ad4120b9d6e397b28ac6984f29071d4955')

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
