# Maintainer: atvknox <atvknox at gmail dot com>

pkgname=blackarch-wallpapers
pkgver=1
pkgrel=1
pkgdesc="BlackArch Linux wallpapers"
arch=('any')
url="https://github.com/BlackArch/blackarch-artwork"
license=('custom')

source=("https://github.com/BlackArch/blackarch-artwork/archive/refs/heads/master.tar.gz")
sha256sums=('SKIP')

package() {
    cd "$srcdir/blackarch-artwork-master/wallpaper"

    install -d "$pkgdir/usr/share/backgrounds/blackarch"
    cp -r . "$pkgdir/usr/share/backgrounds/blackarch/"
}
