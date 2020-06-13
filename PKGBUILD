# Maintainer: Max G <max3227@gmail.com>

pkgname=python-interutils
_pypiname=${pkgname/python-/}
pkgver=0.8.5
pkgrel=1
pkgdesc="A collection of handy utilities and snippets for creating interactive programs"
arch=('any')
url='https://pypi.org/project/interutils/'
license=('MIT')
depends=('python-setuptools' 'python-termcolor')

source=("https://files.pythonhosted.org/packages/03/fb/e81541da3fba6e694874f8d433b7c888f92204e54019372f03fc091b11e8/interutils-0.8.5.tar.gz")
sha256sums=('011ae4879858327803518e7f5a88dcbddbf8b000b28152708a799977c60f33d5')

package() {
    cd $srcdir/${_pypiname}-${pkgver}
    python setup.py install --root="${pkgdir}/" --optimize=1
}

