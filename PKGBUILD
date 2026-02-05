# Maintainer: Nate Craft <secondarynate at icloud dot com>
pkgname=yt-feeds
pkgver=1.0.6
pkgrel=1
pkgdesc="Cross-platform simple, fast, and distraction free CLI application to view videos from your favorite channels"
arch=('x86_64')
url="https://github.com/nate-craft/yt-feeds"
license=('GPL-2.0')
depends=()
conflicts=()
source=("https://github.com/nate-craft/yt-feeds/releases/download/${pkgver}/yt-feeds-${pkgver}-x86_64-unknown-linux-gnu")
sha256sums=('b0edef1751015bc662055d8ee614461aed22015b0e9f15dcd92f6d2817573d02') 

package() {
    install -Dm755 "$srcdir/yt-feeds-${pkgver}-x86_64-unknown-linux-gnu" "$pkgdir/usr/bin/yt-feeds"
}
