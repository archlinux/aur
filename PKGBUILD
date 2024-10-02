# Maintainer: Chooks22

pkgname=migu
pkgver=5.6.2
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
sha256sums=("799117af104fbdfb5ea0108a0c6065005cd0a1bf586b5d5c6d1aac6f08143c8c"
            "ba2fd640b2fa465cb18c3f028b46f2faabedc3103739ef3fe0c369f620b88bb9"
            "adb55a394a24048016db91b62a9124f8617d2dfc58f1d93fbfb819f1902b5341")

package() {
  install -Dm755 "$srcdir/linux-Migu-$pkgver.AppImage" "$pkgdir/usr/bin/migu"
  install -D "$srcdir/migu.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/migu.png"
  install -D "$srcdir/migu.desktop" "$pkgdir/usr/share/applications/migu.desktop"
}
