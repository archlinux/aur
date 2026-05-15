# Maintainer: hup2c <hup@dr.com>
pkgname=onemessage-bin
pkgver=2.37.0
pkgrel=1
pkgdesc="OneMessage 中移集成"
arch=('x86_64')
url="https://www.cmccsi.cn/product/oneoffice"
license=('unknown')
depends=('gtk3')
source=("https://office.hecmcc.com:9003/cmict/file/resource/download/onemsgdownload/OneMessage2.0.deb")
sha256sums=('427f1e1244ce0b82cc733f0d4f0c934e8bb088fce100ea87186b0b1c16d6cdd3')

prepare() {
    ar x "$srcdir/OneMessage2.0.deb"
    tar -xf data.tar.xz
}

package() {
    cp -r opt usr "$pkgdir/"
}
