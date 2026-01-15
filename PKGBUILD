# Maintainer: Sinny Supernova <sinny plus aur at avi dot pw>

pkgname=pipewire-xdg-autostart
pkgver=1.0
pkgrel=6
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
    'f2b98451a14fb79aee67ee934b83afa215c8bf34f78145521f689b2586ae0c8c'
    'b366c2abbcd080a3285fb3bb2f03044ef2cfe63af71420da684a6b48d0cfdbd3'
)

package() {
    install -Dm755 "$srcdir/pipewire-xdg-autostart.sh" "$pkgdir/usr/bin/pipewire-xdg-autostart"
    install -Dm644 "$srcdir/pipewire-xdg-autostart.desktop" "$pkgdir/etc/xdg/autostart/pipewire-xdg-autostart.desktop"
}
