pkgname=startwine
pkgver=400
pkgrel=1
pkgdesc="Software for playing Microsoft Windows games and launchers"
arch=('x86_64')
url="https://github.com/RusNor/StartWine-Launcher"
license=('GPL')

source=("https://github.com/RusNor/StartWine-Launcher/releases/download/StartWine_v$pkgver/StartWine_v$pkgver"
        "StartWine.desktop"
        "StartWine.png")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

package() {
  install -Dm755 "StartWine_v$pkgver" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "StartWine.desktop" -t "$pkgdir/usr/share/applications/"
  install -Dm644 "StartWine.png" -t "$pkgdir/usr/share/pixmaps"
}
