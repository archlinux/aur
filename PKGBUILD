# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>
pkgname=libmystem
pkgver=3.0
pkgrel=2
epoch=0
pkgdesc="C bindings for MyStem morphological analyser."
arch=('x86_64')
url="https://tech.yandex.ru/mystem/"
license=('custom')
depends=('gcc-libs')
provides=('libmystem')

source_x86_64=("https://github.com/yandex/tomita-parser/releases/download/v1.0/libmystem_c_binding.so.linux_x64.zip")
md5sums_x86_64=('6e12995e45b804dd65c744a9ffe1eeca')

package() {
    mkdir -p $pkgdir/usr/lib
    cp *.so $pkgdir/usr/lib
}
