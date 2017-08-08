# Maintainer: desbma
pkgname=mpv-scripts
pkgver=0.26.0
pkgrel=2
pkgdesc="Scripts for the mpv media player officially maintained by the mpv authors"
arch=('any')
url="https://github.com/mpv-player/mpv/tree/master/TOOLS/lua"
license=('GPL')
depends=('mpv')
install=$pkgname.install
source=("mpv-$pkgver.tar.gz::https://github.com/mpv-player/mpv/archive/v$pkgver.tar.gz")
sha512sums=('fd772b4765317eb1ea3b54f12b86e0ac6c4d5e9d16895eb5bebe2e074a01f6b790981b9b34a87d9b23e4291149d3a7154b09fba4a259cec1949a6aa88d6ddec7')

package() {
    cd "mpv-${pkgver}"
    install -Dm 644 -t "$pkgdir/usr/share/mpv/scripts" TOOLS/lua/*
}
