pkgname="concord-git"
pkgver="v2.1.0"
pkgrel="1"
pkgdesc="A Discord API wrapper library made in C"
arch=('any')

package() {
 cd $pkgdir
 git clone https://github.com/Cogmasters/concord.git -b dev
 cd $pkgdir/concord
 make -j$(nproc)
 sudo make install
}
