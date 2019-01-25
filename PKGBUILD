# Maintainer: Steven Spangler <132ikl@gmail.com>
pkgname=linx-client
pkgver=1.5
pkgrel=1
pkgdesc="Simple client for linx-server"
arch=('x86_64')
url="https://github.com/andreimarcu/linx-client"
license=('GPL')
depends=('fuse')
source=("https://github.com/andreimarcu/linx-client/releases/download/v${pkgver}/linx-client-v${pkgver}_linux-amd64")
md5sums=('eda02c3c3e6f5fe6ff2eddbca360408a')

package() {
    mkdir -p $pkgdir/usr/bin/
    cp -L $srcdir/linx-client-v${pkgver}_linux-amd64 $pkgdir/usr/bin/linx-client
    chmod a+x $pkgdir/usr/bin/linx-client
}
