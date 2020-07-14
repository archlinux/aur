# Maintainer: Steven Spangler <132ikl@gmail.com>
pkgname=linx-client
pkgver=1.5.1
pkgrel=1
pkgdesc="Simple client for linx-server"
arch=('x86_64')
url="https://github.com/andreimarcu/linx-client"
license=('GPL')
depends=('fuse')
source=("https://github.com/andreimarcu/linx-client/releases/download/v${pkgver}/linx-client-v${pkgver}_linux-amd64")
md5sums=('4b1f9698b404feea33c531210393fe1c')

package() {
    mkdir -p $pkgdir/usr/bin/
    cp -L $srcdir/linx-client-v${pkgver}_linux-amd64 $pkgdir/usr/bin/linx-client
    chmod a+x $pkgdir/usr/bin/linx-client
}
