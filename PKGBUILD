pkgname=kon
pkgver=1.0.4
pkgrel=2  # Увеличил pkgrel
pkgdesc="Wallpaper fetcher for KDE Plasma from Konachan with resolution detection and D-Bus integration"
arch=('any')
url="https://konachan.net"
license=('MIT')
depends=('python' 'python-requests' 'python-rich' 'kitty' 'xorg-xrandr' 'qt5-tools')
source=('kon')
sha256sums=('5b0c784b1b898b913d456bb54ea94182e71015a0fd6a310b1bfedd6e83d0bbdc')  # Замени на реальный хэш, смотри ниже

package() {
    install -Dm755 "$srcdir/kon" "$pkgdir/usr/bin/kon"
}