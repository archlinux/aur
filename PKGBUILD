# Maintainer: Michael Gerber <aur at lynxcore dot org >
pkgname=open-xchange-file-distribution
pkgver=7.8.0
pkgrel=6
pkgdesc='This package installs bundles taking care to distribute files in the cluster.'
groups=()
install='open-xchange-file-distribution.install'
arch=('any')
url='http://www.ox.io/'
license=('GPLv2')
depends=('open-xchange-core' 'open-xchange-grizzly')
makedepends=()
conflicts=()
provides=('open-xchange-file-distribution')
source=('https://software.open-xchange.com/products/appsuite/stable/debs/DebianJessie/all/open-xchange-file-distribution_7.8.0-6_all.deb')
sha256sums=('73325673077db87c6cf87a0f2a9b19e34cfabd174a4ff8dfb4a5d68628bc31ab')

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
