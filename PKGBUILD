# Maintainer: Immae <ismael.bouya@normalesup.org>
# Contributor: Soehartono Hadibowo <kutkinnaku@gmail.com>
pkgname=sclapp
pkgver=0.5.3
pkgrel=2
pkgdesc="easy-to-use framework for writing simple command-line applications in Python"
url="http://www.alittletooquiet.net/software/sclapp/"
license=('GPL')
depends=('python')
conflicts=()
source=(http://forestbond.com/media/release/${pkgname}-${pkgver}.tar.gz)
arch=('i686' 'x86_64')
md5sums=('815fe32642213fb63cf29d3ffc0a6e33')

package() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  python2 setup.py install --prefix=/usr --root=${pkgdir}
}
