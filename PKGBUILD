# Maintainer: Nate Craft <secondarynate at icloud dot com>
pkgname=yt-feeds
pkgver=1.0.5
pkgrel=2
pkgdesc="Cross-platform simple, fast, and distraction free CLI application to view videos from your favorite channels"
arch=('x86_64')
url="https://github.com/nate-craft/yt-feeds"
license=('GPL-2.0')
depends=()
conflicts=()
source=("https://github.com/nate-craft/yt-feeds/releases/download/${pkgver}/yt-feeds-${pkgver}-x86_64-unknown-linux-gnu")
sha256sums=('4705e12fcf1cd4f0cb3eee562e0ac6486e5af0d148a91ed4eab44e925863b70b') 

package() {
    install -Dm755 "$srcdir/yt-feeds-${pkgver}-x86_64-unknown-linux-gnu" "$pkgdir/usr/bin/yt-feeds"
}
