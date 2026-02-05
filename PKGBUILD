# Maintainer: Nate Craft <secondarynate at icloud dot com>
pkgname=auditorium-minimal
pkgver=1.2.6
pkgrel=2
pkgdesc="A minimal version of the popular cross-platform, local, simple, fast, and distraction free CLI application to listen to your music library"
arch=('x86_64')
url="https://github.com/nate-craft/auditorium"
license=('GPL-2.0')
depends=("mpv" "ffmpeg")
conflicts=('auditorium')
source=("https://github.com/nate-craft/auditorium/releases/download/${pkgver}/auditorium-minimal-${pkgver}-x86_64-unknown-linux-gnu")
sha256sums=('32b2aced2b0e99b5f330de06dea9a1178efdb7bcdc1fce9a9d0a8163304799fb') 

package() {
    install -Dm755 "$srcdir/auditorium-minimal-${pkgver}-x86_64-unknown-linux-gnu" "$pkgdir/usr/bin/auditorium"
}
