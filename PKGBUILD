# Maintainer: Michael Gerber <aur at lynxcore dot org >
pkgname=open-xchange-documents-templates
pkgver=7.8.0
pkgrel=6
pkgdesc='Contains the documents templates for the office productivity'
groups=()
install='open-xchange-documents-templates.install'
arch=('any')
url='http://www.ox.io/'
license=('GPLv2')
depends=()
makedepends=()
conflicts=()
provides=('open-xchange-documents-templates')
source=('https://software.open-xchange.com/products/appsuite/stable/debs/DebianJessie/all/open-xchange-documents-templates_7.8.0-6_all.deb')
sha256sums=('e1f4989ee5585fcfb0171bde9f93ae01236a5148afc44e03205f19bd92289e9f')

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
