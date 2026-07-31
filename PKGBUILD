# Maintainer: devnix <hwrhero13@gmail.com>
pkgname=spotlyric
pkgver=1.0.0
pkgrel=1
pkgdesc="Real-time synced karaoke lyrics for Spotify over MPRIS/DBus"
arch=('any')
url="https://github.com/Hwrhero13gmailcom/spotlyric"
license=('MIT')
depends=('python' 'python-dbus' 'python-requests' 'yt-dlp')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('afdd4d464fa8d0848e24b4abb10ff4894ca18ee57f6a1f2a0ed0f6587129c80d')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 spotlyric.py "$pkgdir/usr/bin/spotlyric"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
