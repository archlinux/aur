# Mainteiner: Perseo <pgutierrez@gmail.com>

pkgname=xsct-git
_pkgname=xsct
pkgver=1.0.1
pkgrel=1
gitname=sct

pkgdesc="Improved sct (set screen color temperature)"
arch=('i686' 'x86_64')
url="https://github.com/faf0/${gitname}"
license=('Public Domain')
depends=()
makedepends=('git' 'libx11' 'libxrandr')
source=("git://github.com/faf0/${gitname}.git")
md5sums=('SKIP')

package() {
  cd "${srcdir}/${gitname}"
	make DESTDIR="${pkgdir}/" install
}

