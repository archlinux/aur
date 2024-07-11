# Maintainer: antekes1 <antekes1dev@gmail.com>
pkgname=hypaper
pkgver=1.2
pkgrel=1
pkgdesc="Very simple Hyprland wallpaper swapper"
arch=('any')
depends=('python' "swww")
url="https://github.com/antekes1/hypaper"
license=('GPL3')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('26f447752b121601cd78b5264aaf76c8d4ad2fed1eb61b21cf1ab9b1142bae7e')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 ./src/main.py "${pkgdir}/usr/bin/hypaper"
}
