# Maintainer: 71e6fd52 <DAStudio.71e6fd52@gmail.com>

pkgbase=('python-accept')
pkgname=('python-accept')
_module='accept'
pkgver='0.1.0'
pkgrel=1
pkgdesc="Parse and order a HTTP Accept header."
url="http://github.com/rhyselsmore/accept"
depends=('python')
makedepends=('python-setuptools')
license=('unknown')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/a/accept/accept-${pkgver}.tar.gz")
md5sums=('924283e7d43b81006eeccfd69d2873f6')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
