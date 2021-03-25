# Mainteiner: Perseo <pgutierrez@gmail.com>
pkgname=xsct
pkgver=1.6.1
pkgrel=1
gitname=sct

pkgdesc="Improved sct (set screen color temperature)"
arch=('i686' 'x86_64')
url="https://github.com/faf0/${gitname}"
license=('Public Domain')
depends=()
makedepends=('git' 'libx11' 'libxrandr')
source=("https://github.com/faf0/sct/archive/refs/tags/${pkgver}.tar.gz")
md5sums=('944acb63bd30e2b5b73112b928f79241')

package() {
  cd "$srcdir/${gitname}-${pkgver}"
  ls -lrt
	make DESTDIR="${pkgdir}/" install
}

