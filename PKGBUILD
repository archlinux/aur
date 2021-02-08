# Maintainer: Nicolas_B

pkgname=cdogs-mission-pack
pkgver=1.0.0
pkgrel=1
pkgdesc="A large collection of user-created campaigns for C-Dogs."
arch=('i686' 'x86_64')
url="https://cxong.github.io/cdogs-sdl/"
license=('GPL2')
depends=('cdogs')
makedepends=('unzip')
source=(missionpack.zip::"https://github.com/cxong/cdogs-sdl/raw/29b6051abbdd1597132897c5ebc372a2ad22a16b/missionpack.zip")
sha256sums=('146fecd0ca467c68c100c3e7a1b3a08d7476408e2219036ce3e2cd54c4b8d04a')

package() {
    cd missionpack
    mkdir -p $pkgdir/usr/share/cdogs/
    cp -r * $pkgdir/usr/share/cdogs/
}
