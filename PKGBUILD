# Maintainer: Chooks22

pkgname=migu
pkgver=5.6.4
pkgrel=1
pkgdesc="Stream anime torrents, real-time with no waiting for downloads"
arch=("x86_64")
url="https://github.com/NoCrypt/migu"
license=("GPL-3.0")
provides=("migu")
options=("!strip")
source=("https://github.com/NoCrypt/migu/releases/download/v$pkgver/linux-migu-$pkgver.AppImage"
        "migu.png"
        "migu.desktop")
sha256sums=("ab904dd8a206c59e3411b176aa65e2557e809dc1a2fb546fe5bd7bda7250f873"
            "ba2fd640b2fa465cb18c3f028b46f2faabedc3103739ef3fe0c369f620b88bb9"
            "adb55a394a24048016db91b62a9124f8617d2dfc58f1d93fbfb819f1902b5341")

package() {
  install -Dm755 "$srcdir/linux-migu-$pkgver.AppImage" "$pkgdir/usr/bin/migu"
  install -D "$srcdir/migu.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/migu.png"
  install -D "$srcdir/migu.desktop" "$pkgdir/usr/share/applications/migu.desktop"
}
