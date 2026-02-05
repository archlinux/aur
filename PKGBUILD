# Maintainer: Nate Craft <secondarynate at icloud dot com>
pkgname=auditorium
pkgver=1.2.6
pkgrel=2
pkgdesc="A cross-platform, local, simple, fast, and distraction free CLI application to listen to your music library"
arch=('x86_64')
url="https://github.com/nate-craft/auditorium"
license=('GPL-2.0')
depends=("mpv" "ffmpeg")
conflicts=("auditorium-minimal")
source=("https://github.com/nate-craft/auditorium/releases/download/${pkgver}/auditorium-${pkgver}-x86_64-unknown-linux-gnu")
sha256sums=('3676f155daae1a449c5d3134fd13e0614553ceff372925292d8fe4a2bda8a11d') 

package() {
    install -Dm755 "$srcdir/auditorium-${pkgver}-x86_64-unknown-linux-gnu" "$pkgdir/usr/bin/auditorium"
}
