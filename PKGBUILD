# Maintainer: Joseph Lansdowne <J49137@gmail.com>
pkgname=flashplayer-standalone-debug
pkgver=32.0.0.445
pkgrel=1
pkgdesc="Standalone, debug version of Adobe Flash Player"
arch=(i686 x86_64)
url="https://www.adobe.com/support/flashplayer/debug_downloads.html"
license=(custom)
depends_i686=(gtk2 libxt nss curl)
depends_x86_64=(lib32-gtk2 lib32-libxt lib32-nss lib32-curl)
source=("flashplayer-standalone-debug-$pkgver-$pkgrel.tar.gz::https://fpdownload.macromedia.com/pub/flashplayer/updaters/32/flash_player_sa_linux_debug.x86_64.tar.gz")
options=(!strip)
sha512sums=('2340272fe60bc3e9c414e9df9cbad381abc7edb10e9a0c948b816f0977613fa3dcda0c364c047a580a1390a201296d6dea44421206a385ff579b995b1804c392')

package () {
    install -Dm755 flashplayerdebugger "$pkgdir/usr/bin/flashplayerdebugger"
    install -Dm644 license.pdf "$pkgdir/usr/share/licenses/$pkgname/license.pdf"
}
