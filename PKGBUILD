# Maintainer: Gustavo Parreira <gustavotcparreira at gmail dot com>
pkgname=hyprshot
pkgver=1.2.2
pkgrel=1
url="https://github.com/Gustash/Hyprshot"
pkgdesc="A utility to easily take screenshots in Hyprland using your mouse"
arch=('any')
license=('GPL')
depends=('jq' 'grim' 'slurp' 'wl-clipboard' 'libnotify' 'imagemagick')
provides=("$pkgname")
conflicts=("$pkgname")
source=("Hyprshot-$pkgver.tar.gz::https://github.com/Gustash/Hyprshot/archive/$pkgver.tar.gz")
sha512sums=('ee135452b7d26ede6ca32f4c52f8a53e686171b789eb66cdcc3dc98f2b4fdabb4ca143f5e0dcca37ac08b6223240a1f148e6592b9878efc728573c6486f17c6d')

package() {
    cd "Hyprshot-$pkgver"
    mkdir -p "$pkgdir/usr/bin"

    cp hyprshot "$pkgdir/usr/bin/"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
