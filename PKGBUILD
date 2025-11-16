# Maintainer: Nate Craft <secondarynate at icloud dot com>
pkgname=yt-feeds
pkgver=1.0.3
pkgrel=1
pkgdesc="Cross-platform simple, fast, and distraction free CLI application to view YouTube videos from your favorite channels"
arch=('x86_64')
url="https://github.com/nate-craft/yt-feeds"
license=('MIT')
depends=("mpv" "yt-dlp")
source=("https://github.com/nate-craft/yt-feeds/releases/download/${pkgver}/yt-feeds-${pkgver}-x86_64-unknown-linux-gnu")
sha256sums=('ee11f2343fad65e0f46f5f626b880889d9c03bf318842de412bad513036661f2')

package() {
    install -Dm755 "$srcdir/yt-feeds-${pkgver}-x86_64-unknown-linux-gnu" "$pkgdir/usr/bin/yt-feeds"
}
