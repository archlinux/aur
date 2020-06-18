# Maintainer: Max G <max3227@gmail.com>

pkgname=python-interutils
_pypiname=${pkgname/python-/}
pkgver=0.9.2
pkgrel=1
pkgdesc="A collection of handy utilities and snippets for creating interactive programs"
arch=('any')
url='https://pypi.org/project/interutils/'
license=('MIT')
depends=('python-setuptools' 'python-termcolor')

source=("https://files.pythonhosted.org/packages/70/84/02221b5d43c76f5a44031197f1867cf25dd286e735ecf2ecd3a64d3beea1/interutils-0.9.2.tar.gz")
sha256sums=('bc67ff0784d2fe0071f27afe93ee511a2bdb38ecfaf794e5cae1ee30ba23c447')

package() {
    cd $srcdir/${_pypiname}-${pkgver}
    python setup.py install --root="${pkgdir}/" --optimize=1
}

