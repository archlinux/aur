# Maintainer: A. Benz <hello@benz.dev>
pkgname=xdph-dmenu-sharepicker
license=('MIT')
pkgver=1.0.1
pkgrel=1
pkgdesc='Hyprland Dmenu Screenshare-Picker'
depends=('hyprland' 'wlr-randr' 'jq')
arch=('any')
conflicts=('xdph-dmenu-sharepicker')
provides=('xdph-dmenu-sharepicker')
sha256sums=('SKIP')
source=("xdph-dmenu-sharepicker")

package() {
    install -Dm755 "$srcdir/xdph-dmenu-sharepicker" "$pkgdir/usr/bin/xdph-dmenu-sharepicker"
}
