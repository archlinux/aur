# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>
pkgname=mystem
pkgver=3.0
pkgrel=1
epoch=0
pkgdesc="Morphological analyser of the text for Russian, Polish and English."
arch=('i686' 'x86_64')
url="https://tech.yandex.ru/mystem/"
license=('custom')
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()

source_i686=("http://download.cdn.yandex.net/mystem/mystem-$pkgver-linux3.5-32bit.tar.gz")
source_x86_64=("http://download.cdn.yandex.net/mystem/mystem-$pkgver-linux3.1-64bit.tar.gz")

md5sums_i686=('a8f340c4f2b6868dc5e79f5433a2b827')
md5sums_x86_64=('79a6ecea8423b05a76829b16d2c8aca0')

validpgpkeys=()

package() {
    mkdir -p $pkgdir/usr/bin
    cp mystem $pkgdir/usr/bin
}
