# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname=mystem
pkgver=3.1
pkgrel=2
epoch=0
pkgdesc='Morphological analyser of the text for Russian, Polish and English.'
arch=('x86_64')
url='https://tech.yandex.ru/mystem/'
license=('custom')
depends=()
makedepends=()
optdepends=('python-pymystem3: Python bindings for mystem.')
source=('http://download.cdn.yandex.net/mystem/mystem-3.1-linux-64bit.tar.gz')
sha256sums=('4696f4ea8ce3ecda24ef5e8dfe7e4b16cfa5f1844edfcca31c34d636b73c0a62')

package() {
    install -m 755 -D -t $pkgdir/usr/bin mystem
}
