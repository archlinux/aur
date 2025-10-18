# Maintainer: Nate Craft <secondarynate at icloud dot com>
pkgname=auditorium-minimal
pkgver=1.2.4
pkgrel=1
pkgdesc="A minimal version of the popular cross-platform, local, simple, fast, and distraction free CLI application to listen to your music library"
arch=('x86_64')
url="https://github.com/nate-craft/auditorium"
license=('MIT')
depends=("mpv" "ffmpeg")
conflicts=('auditorium')
source=("https://github.com/nate-craft/auditorium/releases/download/${pkgver}/auditorium-minimal-v${pkgver}-linux-amd64")
sha256sums=("0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5")

package() {
    install -Dm755 "$srcdir/auditorium-minimal-v${pkgver}-linux-amd64" "$pkgdir/usr/bin/auditorium"
}

