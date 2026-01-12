# Maintainer: Thomas (jfx) <me@jfx.ac>
pkgname=sway-alttab-gui-bin
pkgver=0.0.2
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
sha256sums_x86_64=('f8019942553b682aa2b46f56df2abb331f76a441f25f20c27c346c7808f8519c')
sha256sums_aarch64=('046495edc14cbc75d6028083557861f61b412b2126af2111afe2a447cf8590cb')

package() {
    install -Dm755 "$srcdir/$pkgname-$pkgver-$CARCH" "$pkgdir/usr/bin/sway-alttab-gui"
}
