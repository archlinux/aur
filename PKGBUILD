pkgname=startwine
pkgver=412
pkgrel=1
pkgdesc="Is a Windows application launcher for GNU/Linux operating systems. Includes many features, extensions, and fixes to improve performance, visuals, and usability."
arch=('x86_64')
url="https://github.com/RusNor/StartWine-Launcher"
license=('GPL')

depends=('yad' 'fuse' 'curl')

source=(
    "https://github.com/RusNor/StartWine-Launcher/releases/download/StartWine_v$pkgver/StartWine_v$pkgver"
    "ru.launcher.StartWine.desktop"
    "StartWine.png"
)

sha256sums=("SKIP" "SKIP" "SKIP")

package() {
    install -Dm755 "StartWine_v$pkgver" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "ru.launcher.StartWine.desktop" -t "$pkgdir/usr/share/applications"
    install -Dm644 "StartWine.png" -t "$pkgdir/usr/share/pixmaps"
}
