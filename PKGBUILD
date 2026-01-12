# Maintainer: Your Name <your.email@example.com>
pkgname=adsb-monitor
pkgver=1.0.0
pkgrel=1
pkgdesc="GTK4 desktop app for monitoring adsb.im feeders"
arch=('any')
url="https://github.com/YOURUSERNAME/adsb-monitor"
license=('MIT')
depends=('python' 'python-gobject' 'gtk4' 'libadwaita')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
    cd "$pkgname-$pkgver"
    
    install -Dm755 adsb_monitor.py "$pkgdir/usr/bin/adsb-monitor"
    install -Dm644 adsb-monitor.desktop "$pkgdir/usr/share/applications/adsb-monitor.desktop"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
