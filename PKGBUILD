# Maintainer: Efe Cetin <efectn@6tel.net>
pkgname=unibuild-git
pkgver=rolling
pkgrel=1
pkgdesc="The universal build script system."
arch=('any')
url="https://gitlab.com/sulinos/devel/unibuild"
license=('BSD')
source=(git+https://gitlab.com/sulinos/devel/unibuild.git)
md5sums=('SKIP')

package() {
  cd "$srcdir"/unibuild

  DESTDIR=$pkgdir bash install.sh
}
