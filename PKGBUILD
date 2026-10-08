# Maintainer: hup2c <hup@dr.com>
pkgname=onemessage-bin
pkgver=2.37.5
pkgrel=1
pkgdesc="OneMessage 中移集成"
arch=('x86_64')
url="https://www.cmccsi.cn/product/oneoffice"
license=('unknown')
depends=('gtk3')
source=("https://office.hecmcc.com:9003/cmict/file/resource/download/onemsgdownload/OneMessage2.0.deb")
sha256sums=('de728a6b2c5a7c7513a22757e14d1c17f7e70f556698f29cab9fb56911ade3ac')

prepare() {
    ar x "$srcdir/OneMessage2.0.deb"
    tar -xf data.tar.xz
}

package() {
    cp -r opt usr "$pkgdir/"
}
