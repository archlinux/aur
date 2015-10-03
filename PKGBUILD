# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: Nathan O <ndowens.aur at gmail dot com>
pkgname=httpripper
pkgver=1.1.1
pkgrel=2
pkgdesc="A tool to rip content out of the web"
arch=('i686' 'x86_64')
url="http://29a.ch/httpripper/"
license=('GPL3')
depends=('python2')
source=(http://29a.ch/httpripper/${pkgname}-${pkgver}.tar.gz)
md5sums=('1f2c1dbb90dc5d560a60cb1c90f0c905')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python2 setup.py install --root=${pkgdir}
}
