# Maintainer: Chooks22

pkgname=migu
pkgver=5.6.1
pkgrel=1
pkgdesc="Stream anime torrents, real-time with no waiting for downloads"
arch=("x86_64")
url="https://github.com/NoCrypt/migu"
license=("GPL-3.0")
provides=("migu")
options=("!strip")
source=("https://github.com/NoCrypt/migu/releases/download/v$pkgver/linux-Migu-$pkgver.AppImage"
        "migu.png"
        "migu.desktop")
sha256sums=("a969123d2b651dcb7fd7209d54d92e6d4a278b3b37fdd815e912525ebe605214"
            "ba2fd640b2fa465cb18c3f028b46f2faabedc3103739ef3fe0c369f620b88bb9"
            "adb55a394a24048016db91b62a9124f8617d2dfc58f1d93fbfb819f1902b5341")

package() {
  install -Dm755 "$srcdir/linux-Migu-$pkgver.AppImage" "$pkgdir/usr/bin/migu"
  install -D "$srcdir/migu.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/migu.png"
  install -D "$srcdir/migu.desktop" "$pkgdir/usr/share/applications/migu.desktop"
}
