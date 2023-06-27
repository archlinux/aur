# Maintainer: (epsilom) Xavier Corredor <xavier.corredor.llano (a) gmail.com>
pkgname=jaziku
pkgver=1.0.0
pkgrel=2
pkgdesc="Jaziku is statistical inference software for the teleconnections analysis"
url="https://github.com/XavierCLL/Jaziku"
arch=('i686' 'x86_64')
license=('GPLv3')
depends=('python' 'python-distribute' 'python-scipy' 'python-dateutil' 'python-matplotlib' 'python-numpy' 'python-pillow' 'python-clint' 'imagemagick' 'dos2unix')
optdepends=('ncl: maps' 'hpgl: interpolation')
source=("https://github.com/XavierCLL/Jaziku/archive/refs/heads/py3.zip")
sha256sums=('SKIP')

build() {
    cd Jaziku-py3
    python ./setup.py build
}

package(){
    cd Jaziku-py3
    python ./setup.py install --root=$pkgdir
}
