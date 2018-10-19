pkgbase=('python-authlib')
pkgname=('python-authlib')
_module='Authlib'
pkgver='0.10'
pkgrel=1
pkgdesc="The ultimate Python library in building OAuth and OpenID Connect servers."
url="https://authlib.org/"
depends=('python')
makedepends=('python-setuptools')
license=('AGPL')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/a/authlib/Authlib-${pkgver}.tar.gz")
md5sums=('59e09d688d9d6b01ca68e5deb8f29f7e')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
