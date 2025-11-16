# Maintainer: Nate Craft <secondarynate at icloud dot com>
pkgname=auditorium
pkgver=1.2.5
pkgrel=1
pkgdesc="A cross-platform, local, simple, fast, and distraction free CLI application to listen to your music library"
arch=('x86_64')
url="https://github.com/nate-craft/auditorium"
license=('MIT')
depends=("mpv" "ffmpeg")
conflicts=("auditorium-minimal")
source=("https://github.com/nate-craft/auditorium/releases/download/${pkgver}/auditorium-${pkgver}-x86_64-unknown-linux-gnu")
sha256sums=('85087da0807726b439a31b7bd32cf8a25e36c8c623b2fe4852ed1a126113b024')

package() {
    install -Dm755 "$srcdir/auditorium-${pkgver}-x86_64-unknown-linux-gnu" "$pkgdir/usr/bin/auditorium"
}
