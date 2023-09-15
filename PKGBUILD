# Maintainer: Alexandre Bancel <gimmeapill at gmail dot com>
# Contributor: Oliver Friedrich <olifriedrich at gmail dot com>

pkgname='sword-comm-scofield'
pkgver=2.1
pkgrel=1
pkgdesc="Scofield Reference Notes, 1917 edition based on the version at http://bible.crosswalk.com/ with formatting changes and corrections."
arch=('x86_64')
license=('public-domain')
url="https://packages.debian.org/bookworm/sword-comm-scofield"
depends=('sword')
optdepends=('bibletime')
source=("http://ftp.de.debian.org/debian/pool/main/s/sword-comm-scofield/sword-comm-scofield_2.1-1_all.deb")
sha256sums=('0c11a9533d4870ec40cc72792ecde8aae6e4cc00eca12301150aac018fd5dfcb')

package (){
    bsdtar -xf data.tar.xz
    cp -RPp $(pwd)/usr ../pkg/${pkgname}/usr
}
