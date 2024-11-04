# Maintainer: Francesco chiccocarone@gmail.com

pkgbase='python-snapcast'
pkgname=('python-snapcast')
_module='snapcast'
_src_folder='snapcast-2.3.6'
pkgver='2.3.6'
pkgrel=1
pkgdesc="Python bindings for snapcast"
url="https://github.com/happyleavesaoc/python-snapcast/"
depends=('python')
makedepends=('python-setuptools')
license=('custom:MIT License')
arch=('any')
source=("https://files.pythonhosted.org/packages/31/8c/d87c2c551f84d8488513eb43d426f30cb89b8b658321fe77d5376e718cfd/snapcast-2.3.6.tar.gz")
sha256sums=('002e99231a65377c5a2cbb6bef0de6d1eeb9373708ff32cf53ac3dfc9affcdf0')

build() {
    cd "${srcdir}/${_src_folder}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_src_folder}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
