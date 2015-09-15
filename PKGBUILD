# Maintainer: wenLiangcan <boxeed at gmail dot com>

pkgbase=('pip2pkgbuild')
pkgname=('pip2pkgbuild')
_module='pip2pkgbuild'
pkgver='0.1.1'
pkgrel=1
pkgdesc="Generate PKGBUILD file for a Python module from PyPi"
url="https://github.com/wenLiangcan/pip2pkgbuild"
depends=('python' 'python-setuptools')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://pypi.python.org/packages/source/p/pip2pkgbuild/pip2pkgbuild-${pkgver}.tar.gz")
md5sums=('bc0ffd2fbb789a8952ab6db41030f082')

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}

