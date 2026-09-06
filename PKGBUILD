# Maintainer: Diego Fernández Menéndez <dfimium499 at proton dot me>
pkgname=cmdbeeper
pkgver=1.0.1
pkgrel=1
pkgdesc="PulseAudio/PipeWire terminal beeper"
arch=(any)
url="https://github.com/dfimium499/cmdbeeper"
license=('GPL-3.0-or-later')
depends=('libpulse' 'sound-theme-freedesktop')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dfimium499/cmdbeeper/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('640467b4a2d6e3b1662da71752ed098eb54d2c529cf123f659a51c92ce582a94')

package() {
    install -Dm755 "$srcdir/$pkgname-$pkgver/cmdbeeper.sh" "$pkgdir/usr/bin/cmdbeeper"
    install -Dm644 "$srcdir/$pkgname-$pkgver/man/cmdbeeper.1" "$pkgdir/usr/share/man/man1/cmdbeeper.1"
}
