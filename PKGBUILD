# Maintainer: centi_07 <centi07 at proton dot me>

pkgsubn=metapkg
pkgname=video-drivers-ps4
pkgver=1.0.0
pkgrel=1
pkgdesc="metapackage for ps4 video drivers"
arch=('any')
license=('MIT')
sha256sums=('SKIP')
source=("https://github.com/philc/vimium/archive/refs/tags/v2.1.2.tar.gz")
depends=( 'libdrm-ps4' 'lib32-libdrm-ps4' 'mesa-ps4' 'lib32-mesa-ps4' 'xf86-video-amdgpu-ps4')
package() {
    mkdir -p "$pkgdir/usr/share/"

    cd "$pkgsubn-$pkgver"
    cp -r --no-preserve=ownership . "$pkgdir/usr/share/$pkgname-$pkgver"
}
