# Maintainer: Renato Garcia <fgarcia.renato@gmail.com>
pkgname=trash-cli
pkgver=0.12.7
pkgrel=1
pkgdesc='Command line trashcan (recycle bin) interface'
arch=('any')
url='http://github.com/andreafrancia/trash-cli'
license=('GPL')
depends=('python2' 'python2-distribute')
source=("${pkgname}.tar.gz::http://github.com/andreafrancia/trash-cli/tarball/${pkgver}")
md5sums=('8faff57b8dfa9de54adcc20e87b350fe')

build() {
  cd "${srcdir}/andreafrancia-trash-cli-97b2b9a"
  python2 setup.py build
}

package(){
  cd "${srcdir}/andreafrancia-trash-cli-97b2b9a"
  python2 setup.py install --root="${pkgdir}"
}
