# Maintainer: Olivier Le Moal <mail@olivierlemoal.fr>
pkgbase=python-pycrate
pkgname=('python2-pycrate' 'python-pycrate')
pkgver=0.4
pkgrel=2
pkgdesc="Python library for manipulating various digital formats in an easy way."
arch=(any)
url="https://github.com/P1sec/pycrate"
license=('LGPL2.1')
source=(https://github.com/P1sec/pycrate/archive/${pkgver}.tar.gz)
md5sums=('0a3a6747c3d87929bd50e3be349b2dea')

package_python-pycrate() {
    depends=('python')
    conflicts=("python2-pycrate" "python-pycrate-git" "python2-pycrate-git")

    cd pycrate-${pkgver}
    python setup.py install --root="$pkgdir" --optimize=1
}

package_python2-pycrate() {
    depends=('python2')
    conflicts=("python-pycrate" "python-pycrate-git" "python2-pycrate-git")

    cd pycrate-${pkgver}
    python2 setup.py install --root="$pkgdir" --optimize=1
}
