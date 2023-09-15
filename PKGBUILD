# Maintainer: Alexandre Bancel <gimmeapill at gmail dot com>
# Contributor: Oliver Friedrich <olifriedrich at gmail dot com>

pkgname='sword-dict-strongs-hebrew'
pkgver=3.0
pkgrel=1
pkgdesc="Dictionary of Hebrew Words taken from Strong's Exhaustive Concordance by James Strong, S.T.D., LL.D. 1890."
arch=('x86_64')
license=('public-domain')
url="https://packages.debian.org/bookworm/sword-dict-strongs-hebrew"
depends=('sword')
optdepends=('bibletime')
source=("http://ftp.de.debian.org/debian/pool/main/s/sword-dict-strongs-hebrew/sword-dict-strongs-hebrew_3.0-1_all.deb")
sha256sums=('614e272f6a4153a48cc9893f67d342564de98be23d824e7f8bc7678ca4938cfa')

package (){
    bsdtar -xf data.tar.xz
    cp -RPp $(pwd)/usr ../pkg/${pkgname}/usr
}
