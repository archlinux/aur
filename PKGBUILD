# Mainteiner: Perseo <pgutierrez@gmail.com>
pkgname=xsct
pkgver=1.8
pkgrel=1
gitname=sct

pkgdesc="Improved sct (set screen color temperature)"
arch=('i686' 'x86_64')
url="https://github.com/faf0/${gitname}"
license=('Public Domain')
depends=()
makedepends=('git' 'libx11' 'libxrandr')
source=("https://github.com/faf0/sct/archive/refs/tags/${pkgver}.tar.gz")
md5sums=('dfc7cb20e65c350c5858ee93d155445b')

package() {
  cd "$srcdir/${gitname}-${pkgver}"
  ls -lrt
	make DESTDIR="${pkgdir}/" install
}

