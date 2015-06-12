# Maintainer: Jozef Riha <jose1711 at gmail dot com>

pkgname=surl
pkgver=0.7.1.1
pkgrel=2
pkgdesc="a URL shortening command line application that supports various sites"
url="https://launchpad.net/surl"
license=("GPL-3")
arch=('i686' 'x86_64')
depends=('python2')
source=("http://launchpad.net/${pkgname}/trunk/0.7.1/+download/${pkgname}-${pkgver}.tar.gz")
md5sums=('788198b93dcb82c21a4dbc802d908cf7')

build() {
true
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  python2 setup.py install --root=$pkgdir
}
