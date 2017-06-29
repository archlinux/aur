# Maintainer: Joseph Lansdowne <J49137@gmail.com>
pkgname=flashplayer-standalone-debug
pkgver=26.0.0.131
pkgrel=1
pkgdesc="Standalone, debug version of Adobe Flash Player"
arch=(i686 x86_64)
url="https://www.adobe.com/support/flashplayer/debug_downloads.html"
license=(custom)
depends=(gtk2 libxt nss curl)
[ "$CARCH" = "x86_64" ] && depends=(lib32-gtk2 lib32-libxt lib32-nss lib32-curl)
source=("flashplayer-standalone-debug-$pkgver-$pkgrel.tar.gz::https://fpdownload.macromedia.com/pub/flashplayer/updaters/26/flash_player_sa_linux_debug.x86_64.tar.gz")
options=(!strip)
md5sums=('45a36831a09a3fa42633a3d925b3cec4')

package () {
    install -Dm755 flashplayerdebugger "$pkgdir/usr/bin/flashplayerdebugger"
    install -Dm644 license.pdf "$pkgdir/usr/share/licenses/$pkgname/license.pdf"
}
