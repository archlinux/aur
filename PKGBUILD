# Maintainer: Ember Schryver <katie.schryver@protonmail.com>
# Maintainer: Ethan Atchley <ethanatchley2006@gmail.com>
# Maintainer: Hydral
pkgname=gamejolt-client
pkgname=gamejolt-client
pkgver=1.32.0
pkgrel=4
epoch=
pkgdesc="GameJolt library of game"
arch=(x86_64)
url="https://gamejolt.com/"
license=('MIT')
source=("gamejolt.png"
                "GameJolt.desktop"
                "gamejolt-$pkgver::https://download.gamejolt.net/ab3b7f028299b984e7faa8689c6b8357ce55879bb221e0773277e6ff0d34ebf8,1689826565,7/data/games/5/162/362412/files/64b1dc742580f/gamejoltclient.tar.gz")
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
        mv data-376715-1430054                                   $pkgdir/opt/gamejolt
        chmod 777 $pkgdir/opt/gamejolt/data-376715-1430054

}
md5sums=('4c975528cb791ee16e5c62edbbf28287'
         '92ce58877e47b071ace909969d6a710a'
         'b2bd038af798511c2886d0ea21cfe165')
