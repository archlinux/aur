pkgname=kon
pkgver=1.0.0
pkgrel=1
pkgdesc="Wallpaper fetcher for KDE Plasma from Konachan with resolution detection and D-Bus integration"
arch=('any')
url="https://konachan.net"
license=('MIT')
depends=('python' 'python-requests' 'python-pillow' 'python-rich' 'kitty' 'xorg-xrandr' 'qt5-tools')
source=('kon')
sha256sums=('SKIP')

package() {
    install -Dm755 "$srcdir/kon" "$pkgdir/usr/bin/kon"
}
