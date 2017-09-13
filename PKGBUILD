# Maintainer: desbma
pkgname=mpv-scripts
pkgver=0.27.0
pkgrel=1
pkgdesc="Scripts for the mpv media player officially maintained by the mpv authors"
arch=('any')
url="https://github.com/mpv-player/mpv/tree/master/TOOLS/lua"
license=('GPL')
depends=('mpv')
install=$pkgname.install
source=("mpv-$pkgver.tar.gz::https://github.com/mpv-player/mpv/archive/v$pkgver.tar.gz")
sha512sums=('22738f907d84d362095773972f685e3b03ab4c8172a22ddede290fc221a83ab9135b96f8b18191dabe842b2963f68983929cf065097287fc1a054a7d5f1d0ae4')

package() {
    cd "mpv-${pkgver}"
    install -Dm 644 -t "$pkgdir/usr/share/mpv/scripts" TOOLS/lua/*
}
