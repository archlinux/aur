# Maintainer: Sinny Supernova <sinny plus aur at avi dot pw>

pkgname=pipewire-xdg-autostart
pkgver=1.0
pkgrel=5
pkgdesc="XDG Autostart for pipewire, pipewire-pulse and wireplumber"
arch=('any')
depends=(
    'pipewire'
    'pipewire-pulse'
    'wireplumber'
)
source=(
    'pipewire-xdg-autostart.sh'
    'pipewire-xdg-autostart.desktop'
)
sha256sums=(
    '03c1f478814af07cf1f45a77ef01e71d1602b3d3c0f63615cfd3af9bfe9ccfd6'
    'b366c2abbcd080a3285fb3bb2f03044ef2cfe63af71420da684a6b48d0cfdbd3'
)

package() {
    install -Dm755 "$srcdir/pipewire-xdg-autostart.sh" "$pkgdir/usr/bin/pipewire-xdg-autostart"
    install -Dm644 "$srcdir/pipewire-xdg-autostart.desktop" "$pkgdir/etc/xdg/autostart/pipewire-xdg-autostart.desktop"
}
