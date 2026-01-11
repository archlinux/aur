# Maintainer: Thomas (jfx) <me@jfx.ac>
pkgname=sway-alttab-gui-bin
pkgver=0.0.1
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
sha256sums_x86_64=('69c073ec783949cd65342a06517f851eeeebc1c64d0f3e5aa809cdc5c023dd32')
sha256sums_aarch64=('58e91726cd24d69921b7eca5f839a5ef766f3728d7b7b46f97dcfa25763588a4')

package() {
    install -Dm755 "$srcdir/$pkgname-$pkgver-$CARCH" "$pkgdir/usr/bin/sway-alttab-gui"
}
