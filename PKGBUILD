# Maintainer: Thomas (jfx) <me@jfx.ac>
pkgname=sway-alttab-gui-bin
pkgver=0.0.4
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
sha256sums_x86_64=('f6d3e2a997bf17eb9cc2fe7f21eda48f04d2c7fbc211ceb2c093751a16e4c100')
sha256sums_aarch64=('aab4e399196afbaa6ef296d9bacde8ba7fa4217c8d527e7dcd2e22ab33c8476b')

package() {
    install -Dm755 "$srcdir/$pkgname-$pkgver-$CARCH" "$pkgdir/usr/bin/sway-alttab-gui"
}
