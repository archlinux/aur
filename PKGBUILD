# Maintainer: Gustavo Parreira <gustavotcparreira at gmail dot com>
pkgname=hyprshot
pkgver=1.3.0
pkgrel=1
url="https://github.com/Gustash/Hyprshot"
pkgdesc="A utility to easily take screenshots in Hyprland using your mouse"
arch=('any')
license=('GPL')
depends=('bash' 'jq' 'grim' 'slurp' 'wl-clipboard' 'libnotify')
optdepends=('hyprpicker: to freeze the screen while taking the screenshot')
provides=("$pkgname")
conflicts=("$pkgname")
source=("Hyprshot-$pkgver.tar.gz::https://github.com/Gustash/Hyprshot/archive/$pkgver.tar.gz")
sha512sums=('2177a8de11a728db19156217451f801af22cea6a127ad5629e6dac802c95474175e57c2284c0296814a0202e63bb4ca42a0b8101a67905918f3e198b3ea35598')

package() {
    cd "Hyprshot-$pkgver"
    mkdir -p "$pkgdir/usr/bin"

    cp hyprshot "$pkgdir/usr/bin/"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
