# Maintainer: antekes1 <antekes1dev@gmail.com>
pkgname=hypaper
pkgver=1.1
pkgrel=1
pkgdesc="Very spmple Hyprland wallpapers swapper"
arch=('any')
depends=('python' "swww")
url="https://github.com/antekes1/hypaper"
license=('GPL3')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('09907f7c899cb2200e8cf059c1b9b157dda91dd33edc76e442abfaece47e9ced')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 ./src/main.py "${pkgdir}/usr/bin/hypaper"
}
