# Maintainer: Max G <max3227@gmail.com>

pkgname=python-code-spyder
_pypiname=${pkgname/python-/}
pkgver=1.0.1
pkgrel=1
pkgdesc="Create source trees statistics by recursively crawling directories"
arch=('any')
url='https://pypi.org/project/interutils/'
license=('MIT')
depends=('python-interutils' 'python-prettytable')

source=("https://files.pythonhosted.org/packages/44/56/1441803cbef8a385ebd0082352ec562f466b0e10605eaea743b41356aae3/code-spyder-1.0.1.tar.gz")
sha256sums=('7a0285eec34da8b5c07ea8ff1dc2fdf4f94542017bc383bae46aa63ee864eb3c')

package() {
    cd $srcdir/${_pypiname}-${pkgver}
    python setup.py install --root="${pkgdir}/" --optimize=1
}

