# Maintainer: Joseph Lansdowne <J49137@gmail.com>
pkgname=flashplayer-standalone-debug
pkgver=24.0.0.221
pkgrel=1
pkgdesc="Standalone, debug version of Adobe Flash Player"
arch=(i686 x86_64)
url="https://www.adobe.com/support/flashplayer/debug_downloads.html"
license=(custom)
depends=(gtk2 libxt nss curl)
[ "$CARCH" = "x86_64" ] && depends=(lib32-gtk2 lib32-libxt lib32-nss lib32-curl)
source=("https://fpdownload.macromedia.com/pub/flashplayer/updaters/24/flash_player_sa_linux_debug.x86_64.tar.gz")
options=(!strip)
md5sums=('a1da8320e2323d04fc240cf85cc5434c')

package () {
    install -Dm755 flashplayerdebugger "$pkgdir/usr/bin/flashplayerdebugger"
    install -Dm644 license.pdf "$pkgdir/usr/share/licenses/$pkgname/license.pdf"
}
