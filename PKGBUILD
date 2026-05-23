pkgname=raselaunch
pkgver=1.0.0
pkgrel=1
pkgdesc="An offline and open source Minecraft launcher."
arch=('x86_64')
url="https://github.com/darkness-38/Rase-Launcher"
license=('GPL')
depends=('alsa-lib' 'gtk3' 'nss' 'libxss')
source=("https://github.com/darkness-38/Rase-Launcher/releases/download/v1.0.0/rase-launcher-1.0.0.tar.gz")
sha256sums=('SKIP')

package() {
    install -dm755 "$pkgdir/opt/$pkgname"
    cp -a "$srcdir/"* "$pkgdir/opt/$pkgname/"
    install -dm755 "$pkgdir/usr/bin"
    ln -s "/opt/$pkgname/rase-launcher" "$pkgdir/usr/bin/$pkgname"
}
