# Maintainer: hup2c <hup@dr.com>
pkgname=onemessage-bin
pkgver=2.37.17
pkgrel=1
pkgdesc="OneMessage 中移集成"
arch=('x86_64')
url="https://www.cmccsi.cn/product/oneoffice"
license=('unknown')
depends=('gtk3')
source=("https://office.hecmcc.com:9003/cmict/file/resource/download/onemsgdownload/OneMessage2.0.deb")
sha256sums=('281b1e5089090a45b471e1708c68d105f477ac5325597876f0488a459dc21004')

prepare() {
    ar x "$srcdir/OneMessage2.0.deb"
    tar -xf data.tar.xz
}

package() {
    cp -r opt usr "$pkgdir/"
}
