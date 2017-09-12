# Maintainer: Joseph Lansdowne <J49137@gmail.com>
pkgname=flashplayer-standalone-debug
pkgver=27.0.0.130
pkgrel=1
pkgdesc="Standalone, debug version of Adobe Flash Player"
arch=(i686 x86_64)
url="https://www.adobe.com/support/flashplayer/debug_downloads.html"
license=(custom)
depends=(gtk2 libxt nss curl)
[ "$CARCH" = "x86_64" ] && depends=(lib32-gtk2 lib32-libxt lib32-nss lib32-curl)
source=("flashplayer-standalone-debug-$pkgver-$pkgrel.tar.gz::https://fpdownload.macromedia.com/pub/flashplayer/updaters/27/flash_player_sa_linux_debug.x86_64.tar.gz")
options=(!strip)
md5sums=('2992c6a42239aa4091f27afd6a0eb1fe')

package () {
    install -Dm755 flashplayerdebugger "$pkgdir/usr/bin/flashplayerdebugger"
    install -Dm644 license.pdf "$pkgdir/usr/share/licenses/$pkgname/license.pdf"
}
