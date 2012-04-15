# Maintainer: Renato Garcia <fgarcia.renato@gmail.com>
pkgname=trash-cli
pkgver=0.12.4
pkgrel=1
pkgdesc="Command line trashcan (recycle bin) interface"
arch=('any')
url="http://github.com/andreafrancia/trash-cli"
license=('GPL')
depends=('python2' 'python2-distribute')
source=(${pkgname}.tar.gz::http://github.com/andreafrancia/trash-cli/tarball/${pkgver})
md5sums=('f9178597eed85618094d6425160bae0a')

build() {
  cd "${srcdir}/andreafrancia-trash-cli-15acb89"
  python2 setup.py build
}

package(){
  cd "${srcdir}/andreafrancia-trash-cli-15acb89"
  python2 setup.py install --root=${pkgdir}
}
