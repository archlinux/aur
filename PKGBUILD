# Maintainer: Thomas (jfx) <me@jfx.ac>
pkgname=sway-alttab-gui-bin
pkgver=0.0.6
pkgrel=1
pkgdesc="Windows-style Alt+Tab window switcher for Sway (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/itsjfx/sway-alttab-gui"
license=('GPL-3.0-or-later')
depends=('gtk4' 'gtk4-layer-shell')
provides=('sway-alttab-gui')
conflicts=('sway-alttab-gui')
source_x86_64=("$pkgname-$pkgver-x86_64::$url/releases/download/v$pkgver/sway-alttab-gui-linux-amd64")
source_aarch64=("$pkgname-$pkgver-aarch64::$url/releases/download/v$pkgver/sway-alttab-gui-linux-arm64")
sha256sums_x86_64=('baa7d6a0ddcf806679565f5b48d4283ecec2ba880abed5bc54f0dbae9d6ad0ec')
sha256sums_aarch64=('70981560030283b4871dbb5c41efb6f92a9e4bd93eb12fcb040801fb141194a5')

package() {
    install -Dm755 "$srcdir/$pkgname-$pkgver-$CARCH" "$pkgdir/usr/bin/sway-alttab-gui"
}
