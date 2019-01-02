pkgbase='python-codename'
pkgname='python-codename'
_module='codename'
pkgver='1.1'
pkgrel=2
pkgdesc="Codename generator. Credits to 'projectcodename.com'."
url="https://github.com/and3rson/codename"
depends=('python')
makedepends=('python-setuptools')
license=('unknown')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/c/codename/codename-${pkgver}.tar.gz")
md5sums=('4de2f3229a9321c70dfb290781c2261e')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
