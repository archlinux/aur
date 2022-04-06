# Maintainer: Mohammad Zolfaghari <zidom72@gmail.com>
arch=('x86_64')
pkgdesc="Nordvpn tray icon"
pkgname=nordtray
pkgver=0.1.1
pkgrel=1
depends=('go' 'nordvpn-bin')
source=("https://github.com/zoli/nordtray/releases/download/${pkgver}/nordtray" "https://github.com/zoli/nordtray/archive/${pkgver}.tar.gz")
sha256sums=('44a950af583aceab1eaabd61fe18e4090aa7550322e7a8cbce134140b89b82b7' 'SKIP')
url='https://github.com/zoli/nordtray/'

package() {
	install -D -m644 "$srcdir/$pkgname-$pkgver/assets/nordtray.desktop" "$pkgdir/usr/share/applications/NordTray.desktop"
	install -D -m644 "$srcdir/$pkgname-$pkgver/assets/nord-active.png" "$pkgdir/usr/share/icons/hicolor/48x48/apps/NordTray.png"
	install -D -m755 nordtray "$pkgdir/usr/lib/nordtray/nordtray"
}
