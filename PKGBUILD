# Mainteiner: Perseo <pgutierrez@gmail.com>
pkgname=xsct-git
_pkgname=xsct
pkgver=1.0.0
pkgrel=1

pkgdesc="Improved sct (set screen color temperature)"
arch=('i686' 'x86_64')
url="https://github.com/faf0/sct"
license=('Public Domain')
depends=()
makedepends=('git' 'libx11' 'libxrandr')
source=("git://github.com/faf0/sct.git")
md5sums=('SKIP')

package() {
  cd "$srcdir/sct"
	make DESTDIR="$pkgdir/" install
}

