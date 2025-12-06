# Maintainer: hup2c <hup@dr.com>
pkgname=onemessage-bin
pkgver=2.35.0
pkgrel=1
pkgdesc="OneMessage 中移集成"
arch=('x86_64')
url="https://www.cmccsi.cn/product/oneoffice"
license=('unknown')
depends=('gtk3')
source=("https://office.hecmcc.com:9003/cmict/file/resource/download/onemsgdownload/OneMessage2.0.deb")
sha256sums=('0d95ef00e4bce48e3774a2e086fee227cf5128c633432e973f01dc014429c124')

prepare() {
    ar x "$srcdir/OneMessage2.0.deb"
    tar -xf data.tar.xz
}

package() {
    cp -r opt usr "$pkgdir/"
}
