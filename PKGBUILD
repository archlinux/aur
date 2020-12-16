# Maintainer: Joseph Lansdowne <J49137@gmail.com>
pkgname=flashplayer-standalone-debug
pkgver=32.0.0.465
pkgrel=1
pkgdesc="Standalone, debug version of Adobe Flash Player"
arch=(i686 x86_64)
url="https://www.adobe.com/support/flashplayer/debug_downloads.html"
license=(custom)
depends_i686=(gtk2 libxt nss curl)
depends_x86_64=(lib32-gtk2 lib32-libxt lib32-nss lib32-curl)
source=("flashplayer-standalone-debug-$pkgver-$pkgrel.tar.gz::https://fpdownload.macromedia.com/pub/flashplayer/updaters/32/flash_player_sa_linux_debug.x86_64.tar.gz")
options=(!strip)
sha512sums=('54c5f21f75008b846f691b99e67df755108ff8e962a36b1f764b45d922747fd6ef53053eeff67e3d4a59cf7789d1d012e81479256477a945fd8f0032fec2234d')

package () {
    install -Dm755 flashplayerdebugger "$pkgdir/usr/bin/flashplayerdebugger"
    install -Dm644 license.pdf "$pkgdir/usr/share/licenses/$pkgname/license.pdf"
}
