# Maintainer: Grey Christoforo <first name at last name dot net>

pkgbase=('python-spritex')
pkgname=('python-spritex')
_module='spritex'
pkgver='0.1.3'
pkgrel=1
pkgdesc="A simple tool for extracting sprites from full frames. Useful for AI projects. "
url="https://github.com/codetorex/spritex"
depends=('python' 'python-numpy' 'python-kivy' 'python-pillow')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/s/spritex/spritex-${pkgver}.tar.gz")
md5sums=('6ba03731f5e48b1864bd696c886921cc')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
