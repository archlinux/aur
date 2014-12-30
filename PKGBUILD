# Maintainer: Chris Warrick <aur@chriswarrick.com>
pkgname=mkvimball
pkgver=1
pkgrel=1
pkgdesc="A vimball generator"
arch=('i686' 'x86_64')
url="http://drchip.0sites.net/astronaut/src/index.html#MKVIMBALL"
license=('unknown')
depends=('glibc')
makedepends=('gcc')
source=("mkvimball.tar.gz")
# http://drchip.0sites.net/astronaut/src/mkvimball.tar.gz
# is broken as of 9/10/11.  Providing a copy from 4/25/11.
md5sums=('5822baf3be7ce6eed984d8877495491b')

build() {
    cd ${srcdir}/MKVIMBALL
    make
}

package() {
    cd ${srcdir}/MKVIMBALL
    mkdir -p ${pkgdir}/usr/bin
    install ./mkvimball ${pkgdir}/usr/bin/mkvimball
}
