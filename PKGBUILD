# Maintainer: Thomas (jfx) <me@jfx.ac>
pkgname=sway-alttab-gui-bin
pkgver=0.0.3
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
sha256sums_x86_64=('26f19ef4be0ddeb0677560e1ffe6d7176cc2d842301dad95c689064ccf9f6211')
sha256sums_aarch64=('7ceb217b1f7f3056ca08c12be75ad951950fab41b30778fca074dc5fb064e187')

package() {
    install -Dm755 "$srcdir/$pkgname-$pkgver-$CARCH" "$pkgdir/usr/bin/sway-alttab-gui"
}
