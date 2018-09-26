# Maintainer: bitwave
pkgbase=('python-boofuzz')
pkgname=('python-boofuzz')
_module='boofuzz'
pkgver='0.1.0'
pkgrel=1
pkgdesc=""
url="https://github.com/jtpereyda/boofuzz"
depends=('python')
makedepends=('python-setuptools')
license=('GPL')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/b/boofuzz/boofuzz-${pkgver}.tar.gz")
md5sums=('2a1cf428e0580129693734b43d564136')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
