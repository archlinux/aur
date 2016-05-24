pkgname=python2-dfwinreg
_realname=dfwinreg
pkgver=20160428
pkgrel=1
pkgdesc="Library and tools to access the Windows NT Registry File (REGF) format" 
url="https://github.com/log2timeline/dfwinreg/"
arch=('any')
license=('Apache')

makedepends=('libtool' 'python2')

source=(https://github.com/log2timeline/${_realname}/archive/${pkgver}.zip)


build() {
  cd $srcdir/${_realname}-${pkgver}

  python2 setup.py build
}

package() {
  cd $srcdir/${_realname}-${pkgver}
  python2 setup.py install --root="${pkgdir}"
}
md5sums=('5028a371659451335b7bad48a2f7b246')
