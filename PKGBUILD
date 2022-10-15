pkgname="concord-git"
pkgver="v2.2.0"
pkgrel="1"
depends=('curl')
pkgdesc="A Discord API wrapper library made in C"
arch=('any')

package() {
 cd $pkgdir
 git clone https://github.com/Cogmasters/concord.git -b dev
 cd $pkgdir/concord
 make -j$(nproc)
 sudo make install
}
