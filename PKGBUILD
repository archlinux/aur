pkgname=colobot-gold-music
pkgver=0.1.8_alpha
__ver=0.1.8-alpha
pkgrel=1
pkgdesc="Music pack for Colobot GOLD real-time strategy game."
arch=('any')
url="http://colobot.info"
license=('GPL3')
source=("http://colobot.info/files/music/colobot-music_ogg_$__ver.tar.gz")
md5sums=('9e3c06544674aa01da331795ce69e4ca')
sha1sums=('c477a40f97532e9b470a9bf7eb822c43ef61ddd4')

package() {
    mkdir -p "$pkgdir/usr/share/games/colobot/music"
    find "$srcdir" -name "*.ogg" -exec cp {} "$pkgdir/usr/share/games/colobot/music" ";"
}
