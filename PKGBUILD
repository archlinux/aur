# Maintainer: Gustavo Parreira <gustavotcparreira at gmail dot com>
pkgname=hyprshot
pkgver=1.2.1
pkgrel=4
url="https://github.com/Gustash/Hyprshot"
pkgdesc="A utility to easily take screenshots in Hyprland using your mouse"
arch=('any')
license=('GPL')
depends=('jq' 'grim' 'slurp' 'wl-clipboard' 'libnotify' 'imagemagick')
provides=("$pkgname")
conflicts=("$pkgname")
source=("Hyprshot-$pkgver.tar.gz::https://github.com/Gustash/Hyprshot/archive/$pkgver.tar.gz")
sha512sums=('ba607603ad4cd2ffd25cfd79a6de93b1a9b96d5441660eb307af7e5797922034c471154cf9a8984902b9d39425e4f4fd994abfa0d1560c20163b17d713df97b3')

package() {
    cd "Hyprshot-$pkgver"
    mkdir -p "$pkgdir/usr/bin"

    cp hyprshot "$pkgdir/usr/bin/"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
