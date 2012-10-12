# Maintainer: Renato Garcia <fgarcia.renato@gmail.com>
pkgname=trash-cli
pkgver=0.12.9.14
pkgrel=1
pkgdesc='Command line trashcan (recycle bin) interface'
arch=('any')
url='http://github.com/andreafrancia/trash-cli'
license=('GPL')
depends=('python2' 'python2-distribute')
source=("${pkgname}.tar.gz::http://github.com/andreafrancia/trash-cli/tarball/${pkgver}")
md5sums=('f27f0fad32d0a6176d220ef263cc0c82')

build() {
  cd "${srcdir}/andreafrancia-trash-cli-c9ef553"
  python2 setup.py build
}

package(){
  cd "${srcdir}/andreafrancia-trash-cli-c9ef553"
  python2 setup.py install --root="${pkgdir}"
}
