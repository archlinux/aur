# Maintainer: Ember Schryver <katie.schryver@protonmail.com>
# Maintainer: Ethan Atchley <ethanatchley2006@gmail.com>
# Maintainer: Hydral
pkgname=gamejolt-client-bin
pkgname=gamejolt-client-bin
pkgver=1.34.1
pkgrel=1
epoch=
pkgdesc="GameJolt library of game"
arch=(x86_64)
url="https://gamejolt.com/"
license=('MIT')
source=("gamejolt.png"
                "GameJolt.desktop"
                "gamejolt-$pkgver::https://github.com/Bens0/Gamejolt-Client-Linux-Releases/releases/download/1.34.1/gamejoltclient.tar.gz")
prepare() {
        echo $srcdir
}

build() {
        echo no build
}

check() {
         echo no check
}

package() {
        cd $srcdir

        install -Dm775 gamejolt.png                             $pkgdir/usr/share/icons/gamejolt.png
        install -Dm775 GameJolt.desktop                 $pkgdir/usr/share/applications/GameJolt.desktop
        install -Dm777 .manifest                                        $pkgdir/opt/gamejolt/.manifest
        install -Dm777 game-jolt-client                 $pkgdir/opt/gamejolt/game-jolt-client
        mv data-376715-1458382                                   $pkgdir/opt/gamejolt
        chmod 777 $pkgdir/opt/gamejolt/data-376715-1458382

}
md5sums=('4c975528cb791ee16e5c62edbbf28287'
         '2152981857a2ad786d3df95c42a50bc1'
         '38d1417f1339acd2103fb326224dc46f')
