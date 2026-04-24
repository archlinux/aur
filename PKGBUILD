# Maintainer: diode701 <undeadsan7@gmail.com>
pkgname=nyaa-paper-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="Linux Wallpaper Engine frontend with a keyboard‑first GUI"
arch=('any')
url="https://github.com/diode701/nyaa-paper"
license=('CC-BY-NC-4.0')
depends=('java-runtime>=17' 'linux-wallpaperengine')
source=("$pkgname-$pkgver.tar.gz::https://github.com/diode701/nyaa-paper/releases/download/v$pkgver/nyaa-paper-$pkgver.tar.gz")
sha256sums=('f6511d17ac58f6d70b5505e918dc110bd209f85f1b84536f02ecb5570a0e491a')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm644 lib/nyaa-paper-launcher.jar "$pkgdir/usr/share/$pkgname/nyaa-paper-launcher.jar"
    install -Dm644 lib/nyaa-paper-app.jar "$pkgdir/usr/share/$pkgname/nyaa-paper-app.jar"
    install -Dm644 icon.png "$pkgdir/usr/share/$pkgname/icon.png"
    install -Dm755 bin/nyaa-paper "$pkgdir/usr/bin/nyaa-paper"
    install -Dm755 install.sh "$pkgdir/usr/share/$pkgname/install.sh"
    install -Dm755 uninstall.sh "$pkgdir/usr/share/$pkgname/uninstall.sh"
}
