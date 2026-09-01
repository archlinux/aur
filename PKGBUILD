# Maintainer: Diego Fernández Menéndez <dfimium499 at proton dot me>
pkgname=cmdbeeper
pkgver=1.0.0
pkgrel=1
pkgdesc="PulseAudio/PipeWire terminal beeper"
arch=(any)
url="https://github.com/dfimium499/cmdbeeper"
license=('GPL-3.0-or-later')
depends=('libpulse' 'sound-theme-freedesktop')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dfimium499/cmdbeeper/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b2a6237b767e9698c091cee94f9b2c3d1d607f2a7cd22294dcb2de3b89cc9c8b')

package() {
    install -Dm755 "$srcdir/$pkgname-$pkgver/cmdbeeper.sh" "$pkgdir/usr/bin/cmdbeeper"
    install -Dm644 "$srcdir/$pkgname-$pkgver/man/cmdbeeper.1" "$pkgdir/usr/share/man/man1/cmdbeeper.1"
}
