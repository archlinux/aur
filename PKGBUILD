# Maintainer: Nate Craft <secondarynate at icloud dot com>
pkgname=yt-feeds
pkgver=1.0.0
pkgrel=1
pkgdesc="Cross-platform simple, fast, and distraction free CLI application to view YouTube videos from your favorite channels"
arch=('x86_64')
url="https://github.com/nate-craft/yt-feeds"
license=('MIT')
depends=("mpv" "yt-dlp")
source=("https://github.com/nate-craft/yt-feeds/releases/download/${pkgver}/yt-feeds-v${pkgver}-linux-amd64")
sha256sums=('c7dc5a8ed9e5e05edbe2275c5758a2ba783a40e9a5858716f41916dff6d5b76f')

package() {
    install -Dm755 "$srcdir/yt-feeds-v${pkgver}-linux-amd64" "$pkgdir/usr/bin/yt-feeds"
}
