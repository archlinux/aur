# Maintainer: Craig Barnes <cr@igbarn.es>

pkgname='dex-editor'
pkgver='1.0'
pkgrel='1'
pkgdesc='A small and easy to use text editor'
url='https://github.com/tihirvon/dex'
arch=('i686' 'x86_64' 'armv7l')
license=('GPL2')
depends=('glibc' 'ncurses')
conflicts=('dex')
source=('https://github.com/tihirvon/dex/archive/v1.0/dex-1.0.tar.gz')
md5sums=('2cccdd7454dc58a6d05273f3fcf73518')
sha1sums=('f7709f465738a314804bc199701ccad1fcf7792a')

build() {
    cd "dex-$pkgver"
    make prefix=/usr DESTDIR="$pkgdir"
}

package() {
    cd "dex-$pkgver"
    make prefix=/usr DESTDIR="$pkgdir" install
}
