# Maintainer: Steven Spangler <132ikl@gmail.com>
pkgname=linx-client
pkgver=1.4.0
pkgrel=5
pkgdesc="Simple client for linx-server"
arch=('x86_64')
url="https://github.com/andreimarcu/linx-client"
license=('GPL')
depends=('fuse')
source=("https://github.com/andreimarcu/linx-client/releases/download/v${pkgver}/linx-client-v${pkgver}_linux-amd64")
md5sums=('167abbddc865299062b40a980cb4559f')

package() {
    mkdir -p $pkgdir/usr/bin/
    cp -L $srcdir/linx-client-v${pkgver}_linux-amd64 $pkgdir/usr/bin/linx-client
    chmod a+x $pkgdir/usr/bin/linx-client
}
