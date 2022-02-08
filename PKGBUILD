# Generated using pip2pkgbuild - https://github.com/wenLiangcan/pip2pkgbuild
# Maintainer: loryeam <loryeam@gmail.com>

pkgname=('python-backports.shutil_get_terminal_size')
_module='backports.shutil_get_terminal_size'
pkgver='1.0.0'
pkgrel=2
pkgdesc="A backport of the get_terminal_size function from Python 3.3's shutil."
url="https://github.com/chrippa/backports.shutil_get_terminal_size"
depends=('python')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('713e7a8228ae80341c70586d1cc0a8caa5207346927e23d09dcbcaf18eadec80')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
