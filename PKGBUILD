# Maintainer: Nate Craft <secondarynate at icloud dot com>
pkgname=yt-feeds
pkgver=1.0.2
pkgrel=1
pkgdesc="Cross-platform simple, fast, and distraction free CLI application to view YouTube videos from your favorite channels"
arch=('x86_64')
url="https://github.com/nate-craft/yt-feeds"
license=('MIT')
depends=("mpv" "yt-dlp")
source=("https://github.com/nate-craft/yt-feeds/releases/download/${pkgver}/yt-feeds-${pkgver}-x86_64-unknown-linux-gnu")
sha256sums=('4afe38e1e1e18e24640133ee1019ad30b1bd216d97f36a9e64b1f4e6db3da36b')

package() {
    install -Dm755 "$srcdir/yt-feeds-${pkgver}-x86_64-unknown-linux-gnu" "$pkgdir/usr/bin/yt-feeds"
}
