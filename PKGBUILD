# Maintainer: (epsilom) Xavier Corredor <xavier.corredor.llano (a) gmail.com>
pkgname=jaziku
pkgver=1.0.0
pkgrel=2
pkgdesc="Jaziku is statistical inference software for the teleconnections analysis"
url="https://bitbucket.org/XavierCLL/jaziku"
arch=('i686' 'x86_64')
license=('GPLv3')
depends=('python' 'python-distribute' 'python-scipy' 'python-dateutil' 'python-matplotlib' 'python-numpy' 'python-pillow' 'python-clint' 'imagemagick' 'dos2unix')
optdepends=('ncl: maps' 'hpgl: interpolation')
source=("$pkgname-$pkgver.tar.gz::https://bitbucket.org/XavierCLL/jaziku/get/py3.tar.bz2")
md5sums=('SKIP')

build() {
    cd XavierCLL-jaziku*
    python ./setup.py build || return 1
}

package(){
    cd XavierCLL-jaziku*
    python ./setup.py install --root=$pkgdir || return 1
}
