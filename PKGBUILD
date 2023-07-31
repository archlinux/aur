# Mainteiner: Perseo <perseo.gi98@gmail.com>
pkgname=xsct
pkgver=2.0
pkgrel=1
gitname=sct

pkgdesc="Improved sct (set screen color temperature)"
arch=('i686' 'x86_64')
url="https://github.com/faf0/${gitname}"
license=('Public Domain')
depends=()
makedepends=('git' 'libx11' 'libxrandr')
source=("https://github.com/faf0/sct/archive/refs/tags/${pkgver}.tar.gz")
md5sums=('43caee9b0bff464178b714d68e214b3d')

package() {
    cd "$srcdir/${gitname}-${pkgver}"
    ls -lrt
    make DESTDIR="${pkgdir}/" install
}
