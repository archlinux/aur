# Maintainer: Jeandre Le Roux <theblazehen@theblazehen.com>
pkgname=linx-client
pkgver=1.4
pkgrel=3
pkgdesc=" Simple client for linx-server  "
arch=('x86_64')
url="https://github.com/andreimarcu/linx-client"
license=('GPL')
depends=('fuse')
source=("https://github.com/andreimarcu/linx-client/releases/download/v$pkgver.0/linx-client-v1.4_linux-amd64")
md5sums=('73abab25c8eab14b0d8e9dad3acae9ea')

package() {
    mkdir -p $pkgdir/usr/bin/
    cp -a $srcdir/linx-client-v${pkgver}_linux-amd64 $pkgdir/usr/bin/linx-client
    chmod a+x $pkgdir/usr/bin/linx-client
}
