# Maintainer: desbma
pkgname=mpv-scripts
pkgver=0.29.0
pkgrel=1
pkgdesc='Scripts for the mpv media player officially maintained by the mpv authors'
arch=('any')
url='https://github.com/mpv-player/mpv/tree/master/TOOLS/lua'
license=('GPL')
depends=('mpv')
install=${pkgname}.install
source=("mpv-${pkgver}.tar.gz::https://github.com/mpv-player/mpv/archive/v${pkgver}.tar.gz")
sha512sums=('77204218bd217ae1da4812b09e0509965a3ef102d3de5cd4360f007ccf3779e4cbde5cfd6adae9629ea39062bd365e847429bdf7f9a1ddebd0a67d267492b221')

package() {
    cd "mpv-${pkgver}"
    install -Dm 644 -t "${pkgdir}/usr/share/mpv/scripts" TOOLS/lua/*
}
