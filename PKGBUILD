# Mainteiner: Perseo <pgutierrez@gmail.com>
pkgname=xsct
pkgver=1.9
pkgrel=1
gitname=sct

pkgdesc="Improved sct (set screen color temperature)"
arch=('i686' 'x86_64')
url="https://github.com/faf0/${gitname}"
license=('Public Domain')
depends=()
makedepends=('git' 'libx11' 'libxrandr')
source=("https://github.com/faf0/sct/archive/refs/tags/${pkgver}.tar.gz")
md5sums=('5483876b5a7fb291a7d1aabac41d3c7f')

package() {
    cd "$srcdir/${gitname}-${pkgver}"
    ls -lrt
    make DESTDIR="${pkgdir}/" install
}
