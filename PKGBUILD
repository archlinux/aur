# Maintainer: Steven Spangler <132ikl@gmail.com>
pkgname=linx-client
pkgver=1.4.1
pkgrel=1
pkgdesc="Simple client for linx-server"
arch=('x86_64')
url="https://github.com/andreimarcu/linx-client"
license=('GPL')
depends=('fuse')
source=("https://github.com/andreimarcu/linx-client/releases/download/v${pkgver}/linx-client-v${pkgver}_linux-amd64")
md5sums=('8ab3258d734e9d416d15ab1cf4b9015d')

package() {
    mkdir -p $pkgdir/usr/bin/
    cp -L $srcdir/linx-client-v${pkgver}_linux-amd64 $pkgdir/usr/bin/linx-client
    chmod a+x $pkgdir/usr/bin/linx-client
}
