# Maintainer: Michael Gerber <aur at lynxcore dot org >
pkgname=open-xchange-passwordchange-database
pkgver=7.8.0
pkgrel=6
pkgdesc='The Open-Xchange password-change bundle that only changes the encrypted password in database, but leaves any subsystems (e.g. IMAP/SMTP) as-is'
groups=()
install='open-xchange-passwordchange-database.install'
arch=('any')
url='http://www.ox.io/'
license=('GPLv2')
depends=('open-xchange-core')
makedepends=()
conflicts=()
provides=('open-xchange-passwordchange-database')
source=('https://software.open-xchange.com/products/appsuite/stable/debs/DebianJessie/all/open-xchange-passwordchange-database_7.8.0-6_all.deb')
sha256sums=('39f7f5ee3c770bb850962b576fb2ed1ee432f5a11cd5611780abce440e0443b2')

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
