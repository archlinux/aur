# Maintainer: Nate Craft <secondarynate at icloud dot com>
pkgname=auditorium
pkgver=1.2.4
pkgrel=1
pkgdesc="A cross-platform, local, simple, fast, and distraction free CLI application to listen to your music library"
arch=('x86_64')
url="https://github.com/nate-craft/auditorium"
license=('MIT')
depends=("mpv" "ffmpeg")
conflicts=("auditorium-minimal")
source=("https://github.com/nate-craft/auditorium/releases/download/${pkgver}/auditorium-v${pkgver}-linux-amd64")
sha256sums=('fa15fc913384af791cdf0ba71edf2a4a11d99e21df2fd2d63be6e2f34f36d7fb')

package() {
    install -Dm755 "$srcdir/auditorium-v${pkgver}-linux-amd64" "$pkgdir/usr/bin/auditorium"
}
