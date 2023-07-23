# Maintainer: Rizwan Hasan <rizwan.hasan486@gmail.com>
# TechLearners: https://github.com/TechLearnersInc

pkgname=cythonizer
pkgver=1.2.0b3
pkgrel=1
pkgdesc="Cythonizer is a script that will attempt to automatically convert one or more .py and .pyx files into the corresponding compiled .pyd or .so binary modules files."
arch=('any')
url="https://pypi.org/project/cythonizer/"
license=('MIT')
depends=('python-setuptools' 'cython')
source=("https://pypi.org/packages/source/${pkgname:0:1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('24cfd0ed809b331879e67c458992aec64ee662ca5df213acf5f4d070411d2e12')

package() {
    cd "${pkgname}-${pkgver}"
    python3 setup.py install --root="${pkgdir}" --optimize=1
}