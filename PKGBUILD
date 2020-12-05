# Maintainer: Ethan Atchley <ethanatchley2006@gmail.com>
# Maintainer: Hydral
pkgname=gamejolt-client-bin-aur
pkgname=gamejolt-client-bin-aur
pkgver=0.57.0
pkgrel=1
epoch=
pkgdesc="GameJolt library of game"
arch=(x86_64)
url="https://gamejolt.com/"
license=('MIT')
source=("gamejolt.png"
                "GameJolt.desktop"
                "gamejolt-$pkgver::https://f-cdn.gamejolt.net/data/games/5/162/362412/protected-files-cdn/5fc916a47f5aa/gamejoltclient.tar.gz?secure=_6FmNSKkpdwCFXpyBiI2Fw%2C1607161231")
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
        mv data-376715-939575                                   $pkgdir/opt/gamejolt
        chmod 777 $pkgdir/opt/gamejolt/data-376715-939575

}
md5sums=('4c975528cb791ee16e5c62edbbf28287'
         'e720ff802bc3e2e758ab0a4491e7e13c'
         '7abf832caf3f294bfb172052f956f085')
