# Maintainer: Olivier Le Moal <mail@olivierlemoal.fr>
pkgbase=python-pycrate
pkgname=('python2-pycrate' 'python-pycrate')
pkgver=0.3
pkgrel=1
pkgdesc="Python library for manipulating various digital formats in an easy way."
arch=(any)
url="https://github.com/P1sec/pycrate"
license=('LGPL2.1')
conflicts=("python-pycrate-git" "python2-pycrate-git")
source=('https://github.com/P1sec/pycrate/archive/0.3.tar.gz')
md5sums=('e194f596e7d16bb1c675551a56dcc38d')

package_python-pycrate() {
    depends=('python')
    conflicts=("python2-pycrate")

    cd pycrate-${pkgver}
    python setup.py install --root="$pkgdir" --optimize=1
}

package_python2-pycrate() {
    depends=('python2')
    conflicts=("python-pycrate")

    cd pycrate-${pkgver}
    python2 setup.py install --root="$pkgdir" --optimize=1
}
