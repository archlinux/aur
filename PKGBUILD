# Maintainer: Marc Rechté <marc4@rechte.fr>
pkgname='zlog'
pkgver='1.2.16'
pkgrel=1
pkgdesc='A reliable pure C logging library.'
arch=('x86_64')
url='https://hardysimpson.github.io/zlog/'
license=('GPL2')
source=("$pkgname-$pkgver.tar.gz::https://github.com/HardySimpson/zlog/archive/refs/tags/${pkgver}.tar.gz")
md5sums=('4dcfe75a1acbb5c4513bbe168f935993')

build() {
    cd "$pkgname-${pkgver}"
    make
}

package() {
    cd "$pkgname-${pkgver}"
    make PREFIX="$pkgdir/usr/" install
}

install() {
    ldconfig
}
