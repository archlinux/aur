# Maintainer: Chris Warrick <aur@chriswarrick.com>
pkgname=mkvimball
pkgver=1
pkgrel=2
pkgdesc="A vimball generator"
arch=('i686' 'x86_64')
url="http://www.drchip.org/astronaut/src/"
license=('unknown')
depends=('glibc')
makedepends=('gcc')
source=("http://www.drchip.org/astronaut/src/mkvimball.tar.gz")
md5sums=('5822baf3be7ce6eed984d8877495491b')

build() {
    cd "${srcdir}/MKVIMBALL"
    make
}

package() {
    cd "${srcdir}/MKVIMBALL"
    install -D -m755 ./mkvimball "${pkgdir}/usr/bin/mkvimball"
}
