# Maintainer: Alexandre Bancel <gimmeapill at gmail dot com>
# Contributor: Oliver Friedrich <olifriedrich at gmail dot com>

pkgname='sword-comm-tdavid'
pkgver=2.1
pkgrel=1
pkgdesc="This seven volume Magnum Opus, by Charles H. Spurgeon, was first published in weekly installments over a twenty-year span in the London Metropolitan Tabernacle's periodical, The Sword and the Trowel."
arch=('x86_64')
license=('public-domain')
url="https://packages.debian.org/bookworm/sword-comm-tdavid"
depends=('sword')
optdepends=('bibletime')
source=("http://ftp.de.debian.org/debian/pool/main/s/sword-comm-tdavid/sword-comm-tdavid_2.1-1_all.deb")
sha256sums=('bcbfad701c5c4a061475b58309cebc42755a59e87478c8355227c5e046412b3f')

package (){
    bsdtar -xf data.tar.xz
    cp -RPp $(pwd)/usr ../pkg/${pkgname}/usr
}
