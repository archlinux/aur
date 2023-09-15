# Maintainer: Alexandre Bancel <gimmeapill at gmail dot com>
# Contributor: Oliver Friedrich <olifriedrich at gmail dot com>

pkgname='sword-dict-strongs-greek'
pkgver=3.0
pkgrel=1
pkgdesc="Dictionary of Greek Words taken from Strong's Exhaustive Concordance by James Strong, S.T.D., LL.D. 1890."
arch=('x86_64')
license=('public-domain')
url="https://packages.debian.org/bookworm/sword-dict-strongs-greek"
depends=('sword')
optdepends=('bibletime')
source=("http://ftp.de.debian.org/debian/pool/main/s/sword-dict-strongs-greek/sword-dict-strongs-greek_3.0-3_all.deb")
sha256sums=('760a215591f77082aca38e804dc8b28a8ba1aac5a388dd103bfb333d85f80e97')

package (){
    bsdtar -xf data.tar.xz
    cp -RPp $(pwd)/usr ../pkg/${pkgname}/usr
}
install (){
    echo "You need to configure Greek language properly"
}
