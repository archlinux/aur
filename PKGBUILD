# Maintainer: desbma
pkgname=mpv-scripts
pkgver=0.28.0
pkgrel=1
pkgdesc="Scripts for the mpv media player officially maintained by the mpv authors"
arch=('any')
url="https://github.com/mpv-player/mpv/tree/master/TOOLS/lua"
license=('GPL')
depends=('mpv')
install=$pkgname.install
source=("mpv-$pkgver.tar.gz::https://github.com/mpv-player/mpv/archive/v$pkgver.tar.gz")
sha512sums=('33e889f9ca2dd16ad055ccd9fc5549fcead3fd15dcbc52c6b5f3ef608cf87b3d9952e9236e3dec8e7f32240b68d0b0cff1499f511d39c8f3a0501334f5c57a70')

package() {
    cd "mpv-${pkgver}"
    install -Dm 644 -t "$pkgdir/usr/share/mpv/scripts" TOOLS/lua/*
}
