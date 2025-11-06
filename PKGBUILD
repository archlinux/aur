# Maintainer: FNET Developer <maintainer@farvahar.club>
pkgname=farvahar
pkgver=1.0.1
pkgrel=1
pkgdesc="FNET - Farvahar Network AppImage"
arch=('x86_64')
url="https://farvahar.club/"
license=('GPL')
depends=('fuse2')
source=("FNET-$pkgver.AppImage::https://farvahar.club/download/Farvahar-Network-$pkgver.AppImage")
md5sums=('SKIP')

package() {
    install -Dm755 "$srcdir/FNET-$pkgver.AppImage" \
        "$pkgdir/opt/FNET/FNET.AppImage"

    install -d "$pkgdir/usr/bin"
    ln -s /opt/FNET/FNET.AppImage "$pkgdir/usr/bin/fnet"
}
