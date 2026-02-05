# Maintainer: Nate Craft <secondarynate at icloud dot com>
pkgname=auditorium-minimal
pkgver=1.2.5
pkgrel=2
pkgdesc="A minimal version of the popular cross-platform, local, simple, fast, and distraction free CLI application to listen to your music library"
arch=('x86_64')
url="https://github.com/nate-craft/auditorium"
license=('GPL-2.0')
depends=("mpv" "ffmpeg")
conflicts=('auditorium')
source=("https://github.com/nate-craft/auditorium/releases/download/${pkgver}/auditorium-minimal-${pkgver}-x86_64-unknown-linux-gnu")
sha256sums=('7c87ed3be3ff981f7aea878ec8c065e23c7ac65486722221f68efdc8836bd42a') 

package() {
    install -Dm755 "$srcdir/auditorium-minimal-${pkgver}-x86_64-unknown-linux-gnu" "$pkgdir/usr/bin/auditorium"
}
