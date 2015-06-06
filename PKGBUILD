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
# is broken as of 2011-10-09.  Providing a copy from 2011-04-25.
md5sums=('5822baf3be7ce6eed984d8877495491b')

build() {
    cd "${srcdir}/MKVIMBALL"
    make
}

package() {
    cd "${srcdir}/MKVIMBALL"
    install -D -m755 ./mkvimball "${pkgdir}/usr/bin/mkvimball"
}
