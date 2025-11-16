# Maintainer: Nate Craft <secondarynate at icloud dot com>
pkgname=auditorium-minimal
pkgver=1.2.5
pkgrel=1
pkgdesc="A minimal version of the popular cross-platform, local, simple, fast, and distraction free CLI application to listen to your music library"
arch=('x86_64')
url="https://github.com/nate-craft/auditorium"
license=('MIT')
depends=("mpv" "ffmpeg")
conflicts=('auditorium')
source=("https://github.com/nate-craft/auditorium/releases/download/${pkgver}/auditorium-minimal-${pkgver}-x86_64-unknown-linux-gnu")
sha256sums=('5b0f8fa29fe58868cc98a11288a98c7a8fdb7888f7495b125a294b6acf359e8f')

package() {
    install -Dm755 "$srcdir/auditorium-minimal-${pkgver}-x86_64-unknown-linux-gnu" "$pkgdir/usr/bin/auditorium"
}
