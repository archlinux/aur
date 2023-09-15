# Maintainer: Alexandre Bancel <gimmeapill at gmail dot com>
# Contributor: Oliver Friedrich <olifriedrich at gmail dot com>

pkgname='sword-comm-mhcc'
pkgver=2.0
pkgrel=1
pkgdesc="An abridged version of Matthew Henry's commentary on the whole bible. Matthew Henry (1662-1714) was a Presbyterian minister in Chester."
arch=('x86_64')
license=('public-domain')
url="https://packages.debian.org/bookworm/sword-comm-mhcc"
depends=('sword')
optdepends=('bibletime')
source=("http://ftp.de.debian.org/debian/pool/main/s/sword-comm-mhcc/sword-comm-mhcc_2.0-1_all.deb")
sha256sums=('06f748215de78ff48fdfdee93e3ffc5af6318b976485f7aedf22309236967e35')

package (){
    bsdtar -xf data.tar.xz
    cp -RPp $(pwd)/usr ../pkg/${pkgname}/usr
}
