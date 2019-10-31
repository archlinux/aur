# Maintainer: Jack Chen <redchenjs@live.com>

pkgname=360cloud
pkgver=1.0.0.1010
pkgrel=5
pkgdesc="360 Cloud Drive"
arch=('x86_64')
url="https://yunpan.360.cn/"
license=('custom')
depends=(
    'curl'
    'libbsd'
    'qt5-base'
    'openssl-1.0'
)
source=(
    "http://down.360safe.com/360eyun/360cloud-$pkgver-deepin-x86_64.deb"
)
sha512sums=(
    'deafb66697250a62825b7784b1482eb69a39f61e499c3d67c8f412dc0f6c1fcc78925183ea57f307f7c176cc9a67838fcbe00d81833e6a7e23a0574e95452a1d'
)

package() {
    tar -xf "$srcdir/data.tar.xz" -C "$pkgdir/"

    ln -sf /opt/360cloud/360cloud "$pkgdir/usr/bin/360cloud"
}
