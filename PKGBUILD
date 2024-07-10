# Maintainer: antekes1 <antekes1dev@gmail.com>
pkgname=hypaper
pkgver=1.1
pkgrel=1.1
pkgdesc="Very spmple Hyprland wallpapers swapper"
arch=('any')
depends=('python' "swww")
url="https://github.com/antekes1/hypaper"
license=('GPL3')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('024b34de97a7aed34aec6c415c310bd29446c6de8e97bc0aceb379fc897c7606')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 ./src/main.py "${pkgdir}/usr/bin/hypaper"
}
