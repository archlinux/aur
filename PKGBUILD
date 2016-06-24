# Maintainer: Christopher Loen <christopherloen at gmail dot com>
# Contributor: Rapha??l Doursenaud <rdoursenaud@free.fr>

pkgname='python2-uncompyle2'
_module_='uncompyle2'
pkgver='1.13'
pkgrel=2
pkgdesc='Python 2.7 byte-code decompiler'
arch=('any')
url='https://github.com/wibiti/${_module_}/'
license=('MIT')
depends=('python2')
makedepends=('python2-pip')
source=('git://github.com/wibiti/uncompyle2')
sha512sums=('SKIP')

package() {
  cd "${srcdir}/${_module_}"
  echo :: Installing for Python2.7 ...
  pip2 install --isolated --prefix=/usr --root="${pkgdir}" --no-deps --ignore-installed .
  python2 setup.py install --prefix=/usr --root="${pkgdir}"
}
